require 'rails_helper'

RSpec.describe "deposits/index", type: :view do
  before(:each) do
    assign(:deposits, [
      Deposit.create!(
        account: nil,
        amount: "9.99"
      ),
      Deposit.create!(
        account: nil,
        amount: "9.99"
      )
    ])
  end

  it "renders a list of deposits" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
  end
end
