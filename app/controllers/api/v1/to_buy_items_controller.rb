class Api::V1::ToBuyItemsController < Api::V1::BaseController
  before_action :authenticate_v1_user!

  def create
    list = ToBuyList.find_by(id: params[:id])
    return head(:bad_request) if list.blank?

    @item = ToBuyItem.new(category_params)
    @item.to_buy_list = list
    if @item.save!
      respond_with(@item, status: :ok)
    else
      head(:bad_request)
    end
  end

  def delete
    list = ToBuyList.find_by(id: params[:id])
    item = ToBuyItem.find_by(id: params[:item_id])
    return head(:bad_request) if list.blank? || item.blank?

    respond_with(true, status: :ok) if item.destroy!
  end

  private

  def category_params
    params.permit(:title, :description, :price_amount)
  end
end

