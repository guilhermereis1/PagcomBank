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
class Balance < ApplicationRecord
  belongs_to :account

  serialize :deposit_references, Array
  serialize :withdraw_references, Array
  serialize :transfer_references, Array

  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
