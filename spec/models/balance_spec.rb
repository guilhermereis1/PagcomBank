# == Schema Information
#
# Table name: balances
#
#  id                  :uuid             not null, primary key
#  account_id          :uuid             not null
#  amount              :decimal(10, 2)   default(0.0), not null
#  deposit_references  :text
#  withdraw_references :text
#  transfer_references :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require 'rails_helper'

RSpec.describe Balance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
