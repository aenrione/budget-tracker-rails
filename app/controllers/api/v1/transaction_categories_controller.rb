class Api::V1::TransactionCategoriesController < Api::V1::BaseController
  before_action :authenticate_v1_user!
  before_action :check_user_is_same_as_current_user

  def index
    @categories = current_v1_user.transaction_categories
    @categories = get_pagination_for_records(@categories, params)
    respond_with(@categories, status: :ok, root: "transaction_categories",
                              # serializer: Api::V1::TransactionCategorySerializer,
                              meta: pagination_dict(@categories))
  end

  def create
    @category = TransactionCategory.new(category_params)
    @category.user = current_v1_user
    if @category.save!
      respond_with(@category, status: :ok)
    else
      head(:bad_request)
    end
  end

  private

  def category_params
    params.permit(:name, :description)
  end
end
