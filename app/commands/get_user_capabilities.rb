class GetUserCapabilities < PowerTypes::Command.new(:user)
  def perform
    {
      hasFintocAccount: @user.fintoc_account.present?,
      hasBudaAccount: @user.buda_account.present?,
      hasFintualAccount: @user.fintual_account.present?
    }
  end
end
