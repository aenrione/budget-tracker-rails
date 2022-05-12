class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def index
    @user = current_v1_user
    return head(:bad_request) if @user.fintoc_account.blank?

    @transactions = @user.fintoc_account.transactions
    @transactions = get_pagination_for_records(@transactions, params)
    respond_with(@transactions, status: :ok, root: "transactions",
                                meta: pagination_dict(@transactions))
  end

  def show
    @transaction = current_v1_user.transactions.find_by(id: params[:id]) 
    return head(:bad_request) if @transaction.blank?

    respond_with(@transaction, status: :ok)
  end

  def add_to_category
    category = current_v1_user.transaction_categories.find_by(id: params[:category_id])
    @transaction = current_v1_user.transactions.find_by(id: params[:id]) 
    return head(:bad_request) if @transaction.blank? || category.blank?
     
    @transaction.transaction_category = category
    @transaction.save!
    respond_with(@transaction, status: :ok)
  end

  def remove_category
    category = current_v1_user.transaction_categories.find_by(id: params[:category_id])
    @transaction = current_v1_user.transactions.find_by(id: params[:id]) 
    return head(:bad_request) if @transaction.blank? || category.blank?
    return head(:bad_request) if @transaction.transaction_category != category
     
    @transaction.transaction_category = nil
    @transaction.save!
    respond_with(@transaction, status: :ok)
  end
end
