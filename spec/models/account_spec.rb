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
require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create(:account) }
  let(:balance) { create(:balance, account: account) }
  let(:deposit) { create(:deposit, account: account) }
  let(:withdraw) { create(:withdraw, account: account) }

  context "Associations" do
    it { should belong_to(:user) }
    it { should have_one(:balance) }
    it { should have_many(:deposits) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
  end

  context "Create Balance" do
    it "should create balance" do
      expect(account.balance).to be_present
    end

    it "should create balance with amount 0" do
      expect(account.balance.amount).to eq(0.0)
    end
  end

  context "Create 1 deposits" do
    it "should create 1 deposits" do
      bal = create(:balance, account: account)
      dep = create(:deposit, account: account)

      expect(bal.amount).to eq(account.deposits.sum(:amount))
    end
  end

  context "Create 1 withdraws" do
    it "should create 1 withdraws" do
      bal = create(:balance, account: account)
      dep = create(:deposit, account: account)
      wit1 = create(:withdraw, account: account, amount: 10)

      expect(bal.amount).to eq(90.0)

      wit2 = create(:withdraw, account: account, amount: 15)

      expect(bal.amount).to eq(75.0)
    end
  end

  context "Create 1 transfers" do
    it "should create 1 transfers to another user" do
      user1 = create(:user)
      account1 = create(:account, user: user1)
      user2 = create(:user)
      account2 = create(:account, user: user2)
      bal1 = create(:balance, account: account1)
      bal2 = create(:balance, account: account2)
      dep1 = create(:deposit, account: account1)
      dep2 = create(:deposit, account: account2)

      tr1 = create(:transfer, account: account1, account_to: account2.id, amount: 10)
      
      expect(bal1.amount).to eq(85.0)
    end
  end

  context "Balance cannot be negative" do
    it "should not create balance with negative amount" do
      bal = Balance.new(account: account, amount: -10)
      expect(bal.valid?).to eq(false)
    end
  end

  context "Deposit cannot be negative" do
    it "should not create deposit with negative amount" do
      dep = Deposit.new(account: account, amount: -10)
      expect(dep.valid?).to eq(false)
    end
  end

  context "Withdraw cannot be negative" do
    it "should not create withdraw with negative amount" do
      wit = Withdraw.new(account: account, amount: -10)
      expect(wit.valid?).to eq(false)
    end
  end

  context "Transfer cannot be negative" do
    it "should not create transfer with negative amount" do
      tr = Transfer.new(account: account, account_to: account.id, amount: -10)
      expect(tr.valid?).to eq(false)
    end
  end

  context "Transfer cannot be more than balance + tax" do
    it "should not create transfer with amount more than balance" do
      user1 = create(:user)
      account1 = create(:account, user: user1)
      user2 = create(:user)
      account2 = create(:account, user: user2)

      bal1 = create(:balance, account: account1)
      bal2 = create(:balance, account: account2)

      dep1 = create(:deposit, account: account1)
      dep2 = create(:deposit, account: account2)

      tr1 = Transfer.new(account: account1, account_to: account2.id, amount: 200)
      expect(tr1.valid?).to eq(false)
    end
  end
end
