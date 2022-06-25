class Api::V1::ToBuyItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  attribute :price do
    object.price_amount.format
  end
end
