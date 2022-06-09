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
require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:accounts) { create(:account, user: user) }

  context "Associations" do
    it "Should have many accounts" do
      expect(user).to respond_to(:accounts)
    end
  end

  context "Validations" do
    it "Should have a name presence true" do
      expect(user).to validate_presence_of(:name)
    end
  end
end
