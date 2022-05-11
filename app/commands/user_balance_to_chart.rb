class UserBalanceToChart < PowerTypes::Command.new(:user)
  def perform
    result = { labels: [], data: [], dates: [], formated_data: [] }
    @versions = @user.versions
    @versions.each do |version|
      obj = version.reify
      result[:dates] << obj.updated_at.to_date.to_s
      result[:data] << obj.balance.to_i
      result[:formated_data] << obj.balance_amount.format
    end
    result
  end
end
