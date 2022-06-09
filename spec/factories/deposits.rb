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
FactoryBot.define do
  factory :deposit do
    account { nil }
    amount { "9.99" }
  end
end
