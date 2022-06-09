# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  name                   :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123123' }
    password_confirmation { '123123' }
  end
end
