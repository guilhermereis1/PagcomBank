# == Schema Information
#
# Table name: deposits
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  amount     :decimal(10, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Deposit, type: :model do
  context "Associations" do
    it { should belong_to(:account) }
  end

  context "Validations" do
    it { should validate_presence_of(:amount) }
  end

  context "update_account_balance" do
    it "should update account balance" do
      account = create(:account)
      bal = create(:balance, account: account)
      dep = create(:deposit, account: account, amount: 100)
      expect(bal.amount).to eq(100.0)
      dep = create(:deposit, account: account, amount: 50)
      expect(bal.amount).to eq(150.0)
    end
  end
end