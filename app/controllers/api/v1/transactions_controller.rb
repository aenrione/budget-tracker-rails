class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :authenticate_v1_user!
  before_action :check_user_is_same_as_current_user

  def index
    @user = User.find_by(email: params[:email])
    @transactions = @user.fintoc_account.transactions
    respond_with(@transactions)
  end
end
