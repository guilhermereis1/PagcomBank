module TransfersHelper
  def find_account(id)
    Account.find(id)
  end

  def is_from(transfer)
    find_account(transfer.account_to).user.id != current_user.id
  end
end
