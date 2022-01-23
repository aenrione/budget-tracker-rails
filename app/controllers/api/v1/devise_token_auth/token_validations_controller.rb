class Api::V1::DeviseTokenAuth::TokenValidationsController <
  DeviseTokenAuth::TokenValidationsController
  def validate_token
    # @resource will have been set by set_user_by_token concern
    if @resource
      yield @resource if block_given?
      render_validate_token_success
    else
      render_validate_token_error
    end
  end

  def render_validate_token_success
    data = @resource.token_validation_response
    render json: {
      success: true,
      data: resource_data(resource_json: data)
    }
  end
end
