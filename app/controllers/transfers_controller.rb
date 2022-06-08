class TransfersController < ApplicationController
  before_action :set_transfer, only: %i[ show edit update destroy ]
  layout "user"
  before_action :authenticate_user!
  before_action :set_options, only: [:new, :edit, :create, :update]

  # GET /transfers or /transfers.json
  def index
    @transfers = Transfer.where(account_id: current_user.accounts.pluck(:id))
    @received_transfers = Transfer.where(account_to: current_user.accounts.pluck(:id))

    # Merge transfer with received_transfer
    @transfers = @transfers + @received_transfers
  end

  # GET /transfers/1 or /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers or /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: "Transfer was successfully created." }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: "Transfer was successfully updated." }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1 or /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url, notice: "Transfer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transfer
    @transfer = Transfer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transfer_params
    params.require(:transfer).permit(:account_id, :amount, :account_to)
  end

  def set_options
    @user_accounts = Account.where(user_id: current_user.id, status: true).pluck(:name, :id)
    @all_user_accounts = Account.where(status: true).pluck(:name, :id)
  end
end
