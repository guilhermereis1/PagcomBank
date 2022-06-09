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
    account { create(:account) }
    amount { 0.0 }
    deposit_references { [] }
    withdraw_references { [] }
    transfer_references { [] }
  end
end
