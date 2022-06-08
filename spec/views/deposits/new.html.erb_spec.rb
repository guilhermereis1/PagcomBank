require 'rails_helper'

RSpec.describe "deposits/new", type: :view do
  before(:each) do
    assign(:deposit, Deposit.new(
      account: nil,
      amount: "9.99"
    ))
  end

  it "renders new deposit form" do
    render

    assert_select "form[action=?][method=?]", deposits_path, "post" do

      assert_select "input[name=?]", "deposit[account_id]"

      assert_select "input[name=?]", "deposit[amount]"
    end
  end
end
