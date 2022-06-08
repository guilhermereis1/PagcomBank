require 'rails_helper'

RSpec.describe TodoListItem, type: :model do
  
  let(:todo_list_item) { create(:todo_list_item) }

  context 'Attributes' do
    it 'is valid with valid attributes' do
      expect(todo_list_item).to respond_to(:name)
    end

    it 'todo list item status initializes to false' do
      expect(todo_list_item.completed).to eq(false)
    end

    it 'is not valid without a name' do
      todo_list_item.name = nil
      expect(todo_list_item).to_not be_valid
    end

    it 'Should a validation name' do
      expect(todo_list_item).to be_valid
    end
  end

  context 'Associations' do
    it 'Should belong to a todo_list' do
      expect(todo_list_item).to respond_to(:todo_list)
    end
  end
end
