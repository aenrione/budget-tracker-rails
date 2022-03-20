class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_v1_user!
  before_action :check_user_is_same_as_current_user

  def show
    respond_with(current_v1_user)
  end

  def balance_to_chart
    chart_data = UserBalanceToChart.for(user: current_v1_user)
    respond_with(chart_data)
  end

  def get_capabilities
    respond_with(GetUserCapabilities.for(user: current_v1_user))
  end
end
