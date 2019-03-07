FactoryBot.define do
  factory :coach, class: User do
    name { Faker::Name.name }
    is_coach { true }
  end
end
