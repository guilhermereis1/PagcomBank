class Balance < ApplicationRecord
  belongs_to :account

  serialize :deposit_references, Array
  serialize :withdraw_references, Array
  serialize :transfer_references, Array
end
