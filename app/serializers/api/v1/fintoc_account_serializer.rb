class Api::V1::FintocAccountSerializer < ActiveModel::Serializer
  attributes :id, :account_name

  attribute :balance do
    object.balance_amount.format
  end

  attribute :income do
    object.income_amount.format
  end
  attribute :expense do
    object.expense_amount.format
  end
end

