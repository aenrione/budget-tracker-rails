class UpdateFintocAccountInformation < PowerTypes::Command.new(:fintoc_account)
  require 'fintoc'
  def perform
    balance = 0
    income = 0
    expense = 0
    @client = Fintoc::Client.new(@fintoc_account.encrypted_password)
    @link = @client.get_link(@fintoc_account.link)
    @link.accounts.each do |acc|
      ActiveRecord::Base.transaction do
        # Update Balance
        balance += acc.balance.current
        # Find or Create accounts
        new_account = FintocBankAccount.find_or_create_by!(account_to_db(acc))
        # Sync Transactions
        sync_transactions_from_account(acc, new_account)

        income, expense = get_monthly_indicators_for_account(new_account)
        new_account.income = income
        new_account.expense = expense
        new_account.save!
        income += income
        expense += expense
      end
    end
    @fintoc_account.balance = balance
    @fintoc_account.income = income
    @fintoc_account.expense = expense
    @fintoc_account.save!
  end

  def sync_transactions_from_account(acc, new_account)
    acc.get_movements.each do |mov|
      Transaction.find_or_create_by!(transaction_to_db(mov, new_account.id))
    end
  end

  def account_to_db(acc)
    {
      account_id: acc.id,
      name: acc.name,
      official_name: acc.official_name,
      holder_id: acc.holder_id,
      holder_name: acc.holder_name,
      currency: acc.currency,
      number: acc.number,
      balance: acc.balance.current,
      fintoc_account_id: @fintoc_account.id
    }
  end

  def transaction_to_db(trans, acc_id)
    {
      amount: trans.amount,
      comment: trans.comment,
      description: trans.description,
      transaction_type: trans.type,
      currency: trans.currency,
      transaction_id: trans.id,
      post_date: trans.post_date,
      transaction_date: trans.transaction_date,
      fintoc_bank_account_id: acc_id
    }.merge(get_holder_account(trans))
  end

  def get_holder_account(trans)
    if trans.recipient_account.present?
      recipient = trans.recipient_account
      holder_id = recipient.holder_id
      holder_name = recipient.holder_name
      holder_institution = recipient.institution.name
    elsif trans.sender_account.present?
      sender = trans.sender_account
      holder_id = sender.holder_id
      holder_name = sender.holder_name
      holder_institution = sender.institution.name
    end

    {
      holder_id: holder_id, holder_name: holder_name,
      holder_institution: holder_institution
    }
  end

  def get_monthly_indicators_for_account(account)
    income = 0
    expense = 0
    transactions = account.transactions.where(
      "transaction_date >= ?", Time.zone.today.at_beginning_of_month
    )
    transactions.each do |t|
      if t.amount >= 0
        income += t.amount
      else
        expense += t.amount
      end
    end
    [income, expense]
  end
end
