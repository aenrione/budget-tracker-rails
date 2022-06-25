class GetUserCapabilities < PowerTypes::Command.new(:user)
  def perform
    result = {
      hasFintocAccount: @user.fintoc_account.present?,
      hasBudaAccount: @user.buda_account.present?,
      hasFintualAccount: @user.fintual_account.present?
    }
    if @user.fintoc_account.present?
      result[:fintoc] = Api::V1::FintocAccountSerializer.new(
        @user.fintoc_account
      ).serializable_hash
    end
    if @user.buda_account.present?
      result[:buda] = Api::V1::BudaAccountSerializer.new(
        @user.buda_account
      ).serializable_hash
    end
    if @user.fintual_account.present?
      result[:fintual] = Api::V1::FintualAccountSerializer.new(
        @user.fintual_account
      ).serializable_hash
    end
    result
  end
end
