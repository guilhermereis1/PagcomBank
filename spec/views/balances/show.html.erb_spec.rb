require 'rails_helper'

RSpec.describe "balances/show", type: :view do
  before(:each) do
    @balance = assign(:balance, Balance.create!(
      account: nil,
      amount: "9.99",
      deposit_references: "MyText",
      withdraw_references: "MyText",
      transfer_references: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
