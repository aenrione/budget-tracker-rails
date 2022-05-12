class UserBalanceToChart < PowerTypes::Command.new(:user)
  def perform
    results = {}
    results[:user] = get_obj_balances(@user)
    results[:fintoc_account] = get_obj_balances(@user.fintoc_account) if @user.fintoc_account.present?
    results[:buda_account] = get_obj_balances(@user.buda_account) if @user.buda_account.present?
    results[:fintual_account] = get_obj_balances(@user.fintual_account) if @user.fintual_account.present?
    results
  end

  def get_obj_balances(parent_obj)
    result = { labels: [], data: [], dates: [], formated_data: [], formatted_dates: [] }
    versions = parent_obj.versions
    versions.each do |version|
      obj = version.reify
      result[:dates] << version.created_at.to_date.to_s
      result[:data] << obj.balance.to_i
      result[:formated_data] << obj.balance_amount.format
      result[:formatted_dates] << version.created_at.strftime("%d %b")
    end
    result

  end
end
