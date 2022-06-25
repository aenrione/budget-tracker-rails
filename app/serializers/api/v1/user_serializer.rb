class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :email, :name

  attribute :balances do
    temp = {}
    if object.fintoc_account
      fintoc_balance = object.fintoc_account.balance_amount
      temp[:fintoc] = fintoc_balance.format
    end
    if object.fintual_account
      fintual_balance = object.fintual_account.balance_amount
      temp[:fintual] = fintual_balance.format
    end
    if object.buda_account
      buda_balance = object.buda_account.balance_amount
      temp[:buda] = buda_balance.format
    end
    temp[:total] = object.balance_amount.format
    temp
  end

  attribute :income do
    object.income_amount.format
  end
  attribute :quota do
    object.quota_amount.format
  end
  attribute :remaining do
    object.remaining.format
  end
  attribute :expense do
    object.expense_amount.format
  end
  attribute :investments_return do
    object.investments_amount.format
  end
end
