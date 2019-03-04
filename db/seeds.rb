require 'faker'
require 'active_support/all'

puts 'creating fake coaches and timeslots'
client = User.create(name: Faker::Name.name, is_coach: false)
5.times do |n|
  coach = User.create(name: Faker::Name.name, is_coach: true)
  timezone = ActiveSupport::TimeZone.us_zones.sample

  puts "coach ##{n}: #{coach.inspect}"
  # TODO create optional MULTIPLE timeslots for a single day
  %w(monday tuesday wednesday thursday friday saturday sunday).each do |day|
    puts "coach ##{n}: #{coach.id}"
    next unless [true, false].sample
    start_time = Faker::Time.between(1.day.ago, 1.day.from_now, :morning).at_beginning_of_hour
    end_time = start_time.advance(hours: Faker::Number.between(2, 8), minutes: [0, 30].shuffle[0])
    # save time_slot for each increment of 30mn
    until start_time == end_time
      puts "start time: #{start_time}"
      TimeSlot.create(day: day, from: start_time, to: start_time, coach_id: coach.id, timezone: timezone.name, is_open: true)
      start_time += 30.minutes
    end
  end
end
