require 'rails_helper'

RSpec.describe "transfers/edit", type: :view do
  before(:each) do
    @transfer = assign(:transfer, Transfer.create!(
      account: nil,
      amount: "9.99",
      account_to: "MyString"
    ))
  end

  it "renders the edit transfer form" do
    render

    assert_select "form[action=?][method=?]", transfer_path(@transfer), "post" do

      assert_select "input[name=?]", "transfer[account_id]"

      assert_select "input[name=?]", "transfer[amount]"

      assert_select "input[name=?]", "transfer[account_to]"
    end
  end
end
