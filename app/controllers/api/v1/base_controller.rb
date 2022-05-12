class Api::V1::BaseController < ApplicationController
  before_action do
    self.namespace_for_serializer = ::Api::V1
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ApplicationHelper

  include ApiErrorConcern

  self.responder = ApiResponder

  respond_to :json

  private

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      total_pages: collection.total_pages,
      total_count: collection.total_count
    }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :surname, :username, :email, :avatar)
    devise_parameter_sanitizer.for(:account_update).push(:name, :surname, :email, :avatar)
  end
end
