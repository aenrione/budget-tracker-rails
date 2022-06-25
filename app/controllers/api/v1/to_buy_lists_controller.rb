class Api::V1::ToBuyListsController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def index
    @lists = current_v1_user.to_buy_lists
    @lists = get_pagination_for_records(@lists, params)
    respond_with(@lists, status: :ok,
                 meta: pagination_dict(@lists))
  end

  def show
    list = ToBuyList.find_by(id: params[:id])
    return head(:bad_request) if list.blank?
    respond_with(list, status: :ok)
  end

  def delete
    list = ToBuyList.find_by(id: params[:id])
    return head(:bad_request) if list.blank?

    respond_with(true, status: :ok) if list.destroy!
  end

  def create
    @list = ToBuyList.new(category_params)
    @list.user = current_v1_user
    if @list.save!
      respond_with(@list, status: :ok)
    else
      head(:bad_request)
    end
  end

  private

  def category_params
    params.permit(:title, :description)
  end
end

