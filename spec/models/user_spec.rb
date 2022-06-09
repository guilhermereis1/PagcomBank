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
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'Associations' do
    it 'Should have many todo_list_items' do
      expect(user).to respond_to(:todo_lists)
    end

    it 'Should have many todo_list_items' do
      expect(user).to respond_to(:events)
    end
  end
end
