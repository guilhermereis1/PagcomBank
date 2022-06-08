FactoryBot.define do
  factory :todo_list_item do
    name { Faker::Lorem.word }
    completed { false }
    todo_list { create(:todo_list) }
  end
end
