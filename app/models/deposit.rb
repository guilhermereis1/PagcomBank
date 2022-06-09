# == Schema Information
#
# Table name: deposits
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  amount     :decimal(10, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Deposit < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }

  default_scope { order(created_at: :desc) }

  after_create :update_account_balance

  private

  def update_account_balance
    account.balance.update(amount: account.balance.amount + amount)
    account.balance.update(deposit_references: account.balance.deposit_references << id)
  end
end
