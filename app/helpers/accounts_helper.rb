module AccountsHelper
  def kind_account(kind)
    if kind == Deposit
      return "Depósito"
    elsif kind == Withdraw
      return "Retirada"
    elsif kind == Transfer
      return "Transferência"
    end
  end
end
