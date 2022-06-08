FactoryBot.define do
  factory :transfer do
    account { nil }
    amount { "9.99" }
    account_to { "MyString" }
  end
end
