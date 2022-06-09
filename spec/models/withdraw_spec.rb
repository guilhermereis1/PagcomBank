# == Schema Information
#
# Table name: withdraws
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  amount     :decimal(10, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Withdraw, type: :model do
  context "Associations" do
    it { should belong_to(:account) }
  end
end
