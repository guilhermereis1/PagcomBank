# == Schema Information
#
# Table name: transfers
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  amount     :decimal(10, 2)   not null
#  account_to :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Transfer < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :account_to, presence: true

  default_scope { order(created_at: :desc) }

  validate :account_should_be_different_from_account_to

  before_create :update_account_balance

  def account_should_be_different_from_account_to
    if account_id == account_to
      errors.add(:account_to, "Não é possível transferir para mesma conta")
    end
  end

  validates :amount, numericality: { less_than_or_equal_to: ->(transfer) { transfer.account.balance.amount } }

  validate :tax_values

  def tax_values
    if (amount + (day_tax + amount_tax(amount))) > account.balance.amount
      errors.add(:amount, "Não é possível transferir R$#{amount} pois o saldo é R$#{account.balance.amount} e tem uma taxa de R$#{day_tax + amount_tax(amount)}, seu limite é de: #{account.balance.amount - day_tax - amount_tax(amount)}")
    end
  end

  private

  def update_account_balance
    account.balance.update(amount: (account.balance.amount - (day_tax + amount_tax(amount))) - amount)
    account.balance.update(transfer_references: account.balance.transfer_references << id)

    to_account_to = Account.find(account_to)
    to_account_to.balance.update(amount: to_account_to.balance.amount + amount)
  end

  def day_tax
    if Date.today.wday.between?(1, 5) && Time.now.hour.between?(9, 18)
      return 5
    else
      return 7
    end
  end

  def amount_tax(amount)
    if amount > 1000
      return 10
    else
      return 0
    end
  end
end
