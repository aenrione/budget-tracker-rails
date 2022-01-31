class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_v1_user!
  before_action :check_user_is_same_as_current_user

  def show
    @user = User.find_by(email: params[:email])
    respond_with(@user)
  end
end
