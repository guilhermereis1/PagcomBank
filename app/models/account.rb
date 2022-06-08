class Account < ApplicationRecord
  belongs_to :user
  has_many :deposits
  has_many :withdraws

  validates :name, presence: true
end
