class UpdateBudaAccountInformation < PowerTypes::Command.new(:buda_account)
  require 'buda'
  def perform
    @client = Buda::Client.new(@buda_account.api_key, @buda_account.encrypted_password)
    @balances = @client.balances
    balance = 0
    @balances.each do |cur|
      ActiveRecord::Base.transaction do
        # Update Balance
        balance += currency_to_clp(cur)
        # Find or Create currencies
        BudaCurrency.find_or_create_by!(currency_to_db(cur))
      end
    end
    @buda_account.balance = balance
    @buda_account.save!
  end

  def currency_to_clp(cur)
    return 0 if cur.id == "CLP"

    real_balance = 0
    ticker_amount = @client.get_market("#{cur.id}-clp").ticker.last_price
    real_balance += cur.available.to_f * ticker_amount.to_f
    real_balance
  end

  def currency_to_db(cur)
    {
      currency: cur.id.upcase,
      available: cur.available,
      current: cur.available,
      frozen_amount: cur.frozen,
      pending: cur.pending,
      buda_account_id: @buda_account.id
    }
  end
end
