class Api::V1::FintocAccountsController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def show
    respond_with(current_v1_user.fintoc_account)
  end

  def create
    @account = FintocAccount.new(acc_params)
    @account.user = current_v1_user
    if @account.save!
      respond_with(@account, status: :ok)
    else
      head(:bad_request)
    end
  end

  def delete
    respond_with(current_v1_user.fintoc_account.destroy!, status: :ok)
  end

  private

  def acc_params
    params.permit(:link, :encrypted_password)
  end
end
