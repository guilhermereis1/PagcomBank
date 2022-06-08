class Account < ApplicationRecord
  has_one :balance
  belongs_to :user
  has_many :deposits
  has_many :withdraws
  has_many :transfers

  validates :name, presence: true

  after_create :create_balance

  def create_balance
    Balance.create(account_id: self.id)
  end
end
