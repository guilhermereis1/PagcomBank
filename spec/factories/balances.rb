# == Schema Information
#
# Table name: balances
#
#  id                  :uuid             not null, primary key
#  account_id          :uuid             not null
#  amount              :decimal(10, 2)   default(0.0), not null
#  deposit_references  :text
#  withdraw_references :text
#  transfer_references :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
FactoryBot.define do
  factory :balance do
    account { nil }
    amount { "9.99" }
    deposit_references { "MyText" }
    withdraw_references { "MyText" }
    transfer_references { "MyText" }
  end
end
