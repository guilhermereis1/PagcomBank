require 'rails_helper'

RSpec.describe "deposits/show", type: :view do
  before(:each) do
    @deposit = assign(:deposit, Deposit.create!(
      account: nil,
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
  end
end
