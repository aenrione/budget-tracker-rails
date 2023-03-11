class Api::V1::TransactionSerializer < ActiveModel::Serializer
  attributes :id, :description, :holder_id, :holder_name, :holder_institution,
             :transaction_date, :currency, :comment

  attribute :amount do
    object.transaction_amount.format
  end

  attribute :category do
   if object.transaction_category.present?
      {
        name: object.transaction_category.name,
        id: object.transaction_category.id
      }
    else
      {
        name: "No category",
        id: -1
      }
   end
  end
end
