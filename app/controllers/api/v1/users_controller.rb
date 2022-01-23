class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_v1_user!
  before_action :check_user_is_same_as_current_user

  def show
    return head(:bad_request) if params[:email].nil?

    @user = User.find_by(email: params[:email])
    respond_with(@user)
  end

  private

  def check_user_is_same_as_current_user
    return false if params[:email].nil?

    @user = User.find_by(email: params[:email])
    current_v1_user == @user
  end
end
