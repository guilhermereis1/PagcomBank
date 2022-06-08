require 'rails_helper'

RSpec.describe TodoList, type: :model do

  let(:todo_list) { create(:todo_list) }

  context 'Attributes' do
    it 'is valid with valid attributes' do
      expect(todo_list).to respond_to(:name)
    end

    it 'is not valid without a name' do
      todo_list.name = nil
      expect(todo_list).to_not be_valid
    end

    it 'Should a validation name' do
      expect(todo_list).to be_valid
    end
  end

  context 'Associations' do
    it 'Should have many todo_list_items' do
      expect(todo_list).to respond_to(:todo_list_items)
    end
  end
end
