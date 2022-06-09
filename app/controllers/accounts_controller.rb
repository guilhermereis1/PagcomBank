class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy transactions_per_date ]
  layout "user"
  before_action :authenticate_user!

  # GET /accounts or /accounts.json
  def index
    @accounts = Account.where(user_id: current_user.id)
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    @account_transactions = @account.deposits + @account.withdraws + @account.transfers

    @organized_transactions = organized_transactions(@account_transactions)

    transactions_per_date
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Conta criada com sucesso." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: "Conta atualizara com sucesso." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    @account.update(status: false)
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: "Conta encerrada com sucesso." }
      format.json { head :no_content }
    end
  end

  def organized_transactions(transactions)
    organized_transactions = []

    transactions.each do |transaction|
      trx = {}
      trx[:id] = transaction.id
      trx[:type] = transaction.class
      trx[:amount] = transaction.amount
      trx[:date] = transaction.created_at.strftime("%d/%m/%Y")
      organized_transactions << trx
    end

    return organized_transactions
  end

  def transactions_per_date
    @account_transactions = @account.deposits + @account.withdraws + @account.transfers

    @organized_transactions = organized_transactions(@account_transactions)

    params[:start_date] = params[:start_date].to_date.strftime("%d/%m/%Y") if params[:start_date] && params[:start_date] != ""
    params[:end_date] = params[:end_date].to_date.strftime("%d/%m/%Y") if params[:end_date] && params[:end_date] != ""

    if params[:start_date] && params[:end_date]
      @organized_transactions = @organized_transactions.select do |trx|
        trx[:date] >= params[:start_date] if params[:start_date]
        trx[:date] <= params[:end_date] if params[:end_date]
      end

      @organized_transactions
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:user_id, :name, :status)
  end
end
