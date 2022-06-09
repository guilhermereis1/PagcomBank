# == Schema Information
#
# Table name: accounts
#
#  id         :uuid             not null, primary key
#  user_id    :uuid             not null
#  name       :string           not null
#  status     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
