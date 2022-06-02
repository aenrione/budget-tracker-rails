class ValidateFintocAccount < PowerTypes::Command.new(:fintoc_account)
  def perform
    require 'fintoc'
    client = Fintoc::Client.new(@fintoc_account.encrypted_password)
    link = client.get_link(@fintoc_account.link)
  end
end
