class ValidateBudaAccount < PowerTypes::Command.new(:buda_account)
  require 'buda'
  def perform
    @client = Buda::Client.new(@buda_account.api_key, @buda_account.encrypted_password)
    @balances = @client.balances
  end
end
