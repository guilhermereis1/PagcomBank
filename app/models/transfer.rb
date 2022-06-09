class Transfer < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :account_to, presence: true

  default_scope { order(created_at: :desc) }

  validate :account_should_be_different_from_account_to

  after_create :update_account_balance

  def account_should_be_different_from_account_to
    if account_id == account_to
      errors.add(:account_to, "Não é possível transferir para mesma conta")
    end
  end

  private

  def update_account_balance
    tax = 0.0

    if Date.today.wday.between?(1, 5) && Time.now.hour.between?(9, 18)
      tax = 5
    else
      tax = 7
    end

    if amount > 1000
      tax = 10
    end

    account.balance.update(amount: (account.balance.amount - tax) - amount)
    account.balance.update(transfer_references: account.balance.transfer_references << id)

    to_account_to = Account.find(account_to)
    to_account_to.balance.update(amount: to_account_to.balance.amount + amount)
  end
end
