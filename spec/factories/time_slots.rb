start_time = Faker::Time.between(1.day.ago, 1.day.from_now, :morning).at_beginning_of_hour
end_time = start_time.advance(minutes: 30)

FactoryBot.define do
  factory :time_slot do
    from { start_time }
    to { end_time }
    day { "Monday" }
    timezone { ActiveSupport::TimeZone.us_zones.sample }
    is_open { true }

    coach
  end
end
