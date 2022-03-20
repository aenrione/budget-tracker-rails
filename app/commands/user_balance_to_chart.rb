class UserBalanceToChart < PowerTypes::Command.new(:user)
  def perform
    result = { labels: [], data: [] }
    @versions = @user.versions
    @versions.each do |version|
      obj = version.reify
      # next if obj.balance.zero?

      result[:labels] << obj.updated_at.to_date.to_s
      result[:data] << obj.balance.to_i
    end
    result
  end
end
