class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :email, :name

  attribute :balances do
    fintoc_balance = GetFintocAccountBalance.for(fintoc_account: object.fintoc_account)
    fintual_balance = GetFintualAccountCurrentBalance.for(fintual_account: object.fintual_account)
    buda_balance = GetBudaAccountBalance.for(buda_account: object.buda_account)
    total = fintoc_balance + fintual_balance + buda_balance
    {
      total: total.format,
      fintoc: fintoc_balance.format,
      fintual: fintual_balance.format,
      buda: buda_balance.format
    }
  end
end
