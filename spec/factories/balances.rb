FactoryBot.define do
  factory :balance do
    account { nil }
    amount { "9.99" }
    deposit_references { "MyText" }
    withdraw_references { "MyText" }
    transfer_references { "MyText" }
  end
end
