require 'rails_helper'

RSpec.describe "transfers/index", type: :view do
  before(:each) do
    assign(:transfers, [
      Transfer.create!(
        account: nil,
        amount: "9.99",
        account_to: "Account To"
      ),
      Transfer.create!(
        account: nil,
        amount: "9.99",
        account_to: "Account To"
      )
    ])
  end

  it "renders a list of transfers" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Account To".to_s, count: 2
  end
end
