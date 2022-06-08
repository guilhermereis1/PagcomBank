require 'rails_helper'

RSpec.describe "withdraws/new", type: :view do
  before(:each) do
    assign(:withdraw, Withdraw.new(
      account: nil,
      amount: "9.99"
    ))
  end

  it "renders new withdraw form" do
    render

    assert_select "form[action=?][method=?]", withdraws_path, "post" do

      assert_select "input[name=?]", "withdraw[account_id]"

      assert_select "input[name=?]", "withdraw[amount]"
    end
  end
end
