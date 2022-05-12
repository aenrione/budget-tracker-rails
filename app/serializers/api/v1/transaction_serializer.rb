class Api::V1::TransactionSerializer < ActiveModel::Serializer
  attributes :id, :description, :holder_id, :holder_name, :holder_institution,
             :transaction_date, :currency, :comment

  attribute :amount do
    object.transaction_amount.format
  end

  attribute :category do
    object.transaction_category.name if object.transaction_category.present?
  end
end
