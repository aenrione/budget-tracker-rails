class GetUserCapabilities < PowerTypes::Command.new(:user)
  def perform
    {
      hasFintocAccount: @user.fintoc_account.present?,
      hasBudaAccount: @user.buda_account.present?,
      hasFintualAccount: @user.fintual_account.present?,
      fintoc: Api::V1::FintocAccountSerializer.new(@user.fintoc_account).serializable_hash,
      buda: Api::V1::BudaAccountSerializer.new(@user.buda_account).serializable_hash,
      fintual: Api::V1::FintualAccountSerializer.new(@user.fintual_account).serializable_hash
    }
  end
end
