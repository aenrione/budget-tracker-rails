class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def show
    respond_with(current_v1_user)
  end

  def balance_to_chart
    chart_data = UserBalanceToChart.for(user: current_v1_user)
    respond_with(chart_data)
  end

  def transactions_by_category_to_chart
    chart_data = TransactionsToChart.for(user: current_v1_user, month: params[:month],
                                         type: params[:type])
    respond_with(chart_data)
  end

  def get_capabilities
    respond_with(GetUserCapabilities.for(user: current_v1_user))
  end

  def set_quota
    return head(:bad_request) if params[:quota].blank?
     
    current_v1_user.quota = params[:quota]
    current_v1_user.save!
    respond_with(current_v1_user, status: :ok)
  end
end
