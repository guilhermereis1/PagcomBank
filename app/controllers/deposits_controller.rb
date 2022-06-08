class DepositsController < ApplicationController
  before_action :set_deposit, only: %i[ show edit update destroy ]
  layout "user"
  before_action :authenticate_user!
  before_action :set_options, only: [:new, :edit, :create, :update]

  # GET /deposits or /deposits.json
  def index
    @deposits = Deposit.where(account_id: current_user.accounts.pluck(:id))
  end

  # GET /deposits/1 or /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @deposit = Deposit.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits or /deposits.json
  def create
    @deposit = Deposit.new(deposit_params)

    respond_to do |format|
      if @deposit.save
        format.html { redirect_to @deposit, notice: "Deposit was successfully created." }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposits/1 or /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        format.html { redirect_to @deposit, notice: "Deposit was successfully updated." }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deposits/1 or /deposits/1.json
  def destroy
    @deposit.destroy
    respond_to do |format|
      format.html { redirect_to deposits_url, notice: "Deposit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_deposit
    @deposit = Deposit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def deposit_params
    params.require(:deposit).permit(:account_id, :amount)
  end

  def set_options
    @user_accounts = Account.where(user_id: current_user.id).pluck(:name, :id)
  end
end
