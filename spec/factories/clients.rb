FactoryBot.define do
  factory :client, class: 'User' do
    name { Faker::Name.name }
    is_coach { false }
  end
end
