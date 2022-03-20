class Api::V1::BudaAccountsController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def show
    respond_with(current_v1_user.buda_account)
  end

  def create
    @account = BudaAccount.new(acc_params)
    @account.user = current_v1_user
    if @account.save!
      respond_with(@account, status: :ok)
    else
      head(:bad_request)
    end
  end

  private

  def acc_params
    params.permit(:api_key, :encrypted_password)
  end
end
