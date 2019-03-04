require 'faker'
require 'active_support/all'

puts 'creating fake coaches and timeslots'
5.times do |n|
  coach = User.create(name: Faker::Name.name, is_coach: true)
  timezone = ActiveSupport::TimeZone.us_zones.sample

  puts "coach ##{n}: #{coach.inspect}"
  # TODO create optional MULTIPLE timeslots for a single day
  %w(1 2 3 4 5 6 7).each do |day|
    puts "coach ##{n}: #{coach.id}"
    next unless [true, false].sample
    start_time = Faker::Time.between(1.day.ago, 1.day.from_now, :morning).at_beginning_of_hour
    end_time = start_time.advance(hours: Faker::Number.between(2, 8), minutes: [0, 30].shuffle[0])

    time_slot = TimeSlot.create(day: day, from: start_time, to: end_time, coach_id: coach.id, timezone: timezone.name)
  end
end
