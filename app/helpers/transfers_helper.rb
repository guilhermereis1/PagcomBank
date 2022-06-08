module TransfersHelper

  def find_account(id)
    Account.find(id)
  end
end
