class Deposit < ApplicationRecord
  belongs_to :account

  validates :amount, presence: true, numericality: { greater_than: 0 }

  default_scope { order(created_at: :desc) }
end
