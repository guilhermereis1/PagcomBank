class Transfer < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :account_to, presence: true

  default_scope { order(created_at: :desc) }

  validate :account_should_be_different_from_account_to

  def account_should_be_different_from_account_to
    if account_id == account_to
      errors.add(:account_to, "Não é possível transferir para mesma conta")
    end
  end
end
