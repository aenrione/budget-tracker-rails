class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :authenticate_v1_user!
  before_action :check_user_is_same_as_current_user

  def index
    @user = User.find_by(email: params[:email])
    @transactions = @user.fintoc_account.transactions
    @transactions = get_pagination_for_records(@transactions, params)
    respond_with(@transactions, status: :ok, root: "transactions",
                                meta: pagination_dict(@transactions))
  end
end
