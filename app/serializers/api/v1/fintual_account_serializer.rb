class Api::V1::FintualAccountSerializer < ActiveModel::Serializer
  attributes :id, :account_name

  attribute :balance do
    object.balance_amount.format
  end
  attribute :investments_return do
    object.return_amount.format
  end
end
