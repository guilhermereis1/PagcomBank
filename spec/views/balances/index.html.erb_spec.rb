require 'rails_helper'

RSpec.describe "balances/index", type: :view do
  before(:each) do
    assign(:balances, [
      Balance.create!(
        account: nil,
        amount: "9.99",
        deposit_references: "MyText",
        withdraw_references: "MyText",
        transfer_references: "MyText"
      ),
      Balance.create!(
        account: nil,
        amount: "9.99",
        deposit_references: "MyText",
        withdraw_references: "MyText",
        transfer_references: "MyText"
      )
    ])
  end

  it "renders a list of balances" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
