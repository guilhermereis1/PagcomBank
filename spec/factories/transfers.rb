# == Schema Information
#
# Table name: transfers
#
#  id         :uuid             not null, primary key
#  account_id :uuid             not null
#  amount     :decimal(10, 2)   not null
#  account_to :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :transfer do
    account_id { create(:account).id }
    amount { 0.0 }
    account_to { create(:account).id }
  end
end
