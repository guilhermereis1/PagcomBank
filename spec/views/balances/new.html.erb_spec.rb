require 'rails_helper'

RSpec.describe "balances/new", type: :view do
  before(:each) do
    assign(:balance, Balance.new(
      account: nil,
      amount: "9.99",
      deposit_references: "MyText",
      withdraw_references: "MyText",
      transfer_references: "MyText"
    ))
  end

  it "renders new balance form" do
    render

    assert_select "form[action=?][method=?]", balances_path, "post" do

      assert_select "input[name=?]", "balance[account_id]"

      assert_select "input[name=?]", "balance[amount]"

      assert_select "textarea[name=?]", "balance[deposit_references]"

      assert_select "textarea[name=?]", "balance[withdraw_references]"

      assert_select "textarea[name=?]", "balance[transfer_references]"
    end
  end
end
