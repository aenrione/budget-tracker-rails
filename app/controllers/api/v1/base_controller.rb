class Api::V1::BaseController < ApplicationController
  before_action do
    self.namespace_for_serializer = ::Api::V1
  end
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ApplicationHelper

  include ApiErrorConcern

  self.responder = ApiResponder

  respond_to :json

  def check_user_is_same_as_current_user
    return false if params[:email].nil?

    @user = User.find_by(email: params[:email])
    current_v1_user == @user
  end

  private

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end
end
