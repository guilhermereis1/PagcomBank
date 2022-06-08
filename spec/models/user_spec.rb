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
