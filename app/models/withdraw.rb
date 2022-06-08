class Withdraw < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }

  default_scope { order(created_at: :desc) }

  after_create :update_account_balance

  validate :amount_cannot_be_greater_than_balance_amount

  private

  def amount_cannot_be_greater_than_balance_amount
    if account.balance.amount == 0.0
      errors.add(:amount, "Você não possui saldo em conta para realizar essa operação")
    end

    if amount > account.balance.amount
      errors.add(:amount, "não pode ser maior que o saldo da conta")
    end
  end

  def update_account_balance
    account.balance.update(amount: account.balance.amount - amount)
    account.balance.update(withdraw_references: account.balance.withdraw_references << id)
  end
end
