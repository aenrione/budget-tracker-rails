class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :email, :name

  attribute :amount do
    object.amount.format(drop_trailing_zeros: true, with_currency: false)
  end
end
