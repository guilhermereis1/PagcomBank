FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word }
    event_type { ['Congrats', 'Shame'].sample }
    properties { "" }
  end
end
