class Api::V1::TransactionCategorySerializer < ActiveModel::Serializer
  attributes :description, :name, :id
end
