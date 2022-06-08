require 'rails_helper'

RSpec.describe "transfers/new", type: :view do
  before(:each) do
    assign(:transfer, Transfer.new(
      account: nil,
      amount: "9.99",
      account_to: "MyString"
    ))
  end

  it "renders new transfer form" do
    render

    assert_select "form[action=?][method=?]", transfers_path, "post" do

      assert_select "input[name=?]", "transfer[account_id]"

      assert_select "input[name=?]", "transfer[amount]"

      assert_select "input[name=?]", "transfer[account_to]"
    end
  end
end
