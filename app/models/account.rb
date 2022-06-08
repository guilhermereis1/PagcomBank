class Account < ApplicationRecord
  belongs_to :user
  has_many :deposits

  validates :name, presence: true
end
