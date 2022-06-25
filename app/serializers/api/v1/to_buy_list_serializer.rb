class Api::V1::ToBuyListSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  attribute :total do
    object.total.format
  end
  attribute :user_remaining do
    object.user.remaining.format
  end
  attribute :expense_remaining do
    (object.user.remaining - object.total).format
  end

  has_many :to_buy_items
end
