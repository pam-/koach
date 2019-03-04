require 'faker'
require 'active_support/all'

puts 'Creating a user...'
client = User.create(name: Faker::Name.name, is_coach: false)
puts "User: #{client.inspect}"

puts 'Creating coaches and timeslots...'
5.times do |n|
  coach = User.create(name: Faker::Name.name, is_coach: true)
  timezone = ActiveSupport::TimeZone.us_zones.sample

  puts "coach ##{n}: #{coach.inspect}"
  %w(monday tuesday wednesday thursday friday saturday sunday).each do |day|
    puts "coach ##{n}: #{coach.id}"
    next unless [true, false].sample
    start_time = Faker::Time.between(1.day.ago, 1.day.from_now, :morning).at_beginning_of_hour
    end_time = start_time.advance(hours: Faker::Number.between(2, 8), minutes: [0, 30].shuffle[0])
    # save time_slot with increment of 30mn until we get to end of avalibility
    until start_time == end_time
      timeslot = TimeSlot.create(day: day, from: start_time, to: start_time, coach_id: coach.id, timezone: timezone.name, is_open: true)
      start_time += 30.minutes
    end
  end
end

puts 'Done seeding data!'
