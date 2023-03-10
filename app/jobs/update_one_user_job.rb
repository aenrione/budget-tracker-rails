class UpdateOneUserJob < ApplicationJob
  def perform(user_email)
    @user = User.find_by(email: user_email)
    update_user(@user)
  end

  def update_user(user)
    ActiveRecord::Base.transaction do
      if user.buda_account.present?
        UpdateBudaAccountInformation.for(buda_account: user.buda_account)
      end
      if user.fintoc_account.present?
        UpdateFintocAccountInformation.for(fintoc_account: user.fintoc_account)
      end
      if user.fintual_account.present?
        UpdateFintualAccountInformation.for(fintual_account: user.fintual_account)
      end
      update_user_balance(user)
      update_user_indicators(user)
      user.save!
    end
  end

  def update_user_balance(user)
    user.balance = 0
    if user.fintoc_account.present?
      user.balance += user.fintoc_account.balance
    end
    if user.fintual_account.present?
      user.balance += user.fintual_account.balance
    end
    if user.buda_account.present?
      user.balance += user.buda_account.balance
    end
  end

  def update_user_indicators(user)
    user.income = 0
    user.expense = 0
    user.investments_return = 0
    if user.fintoc_account.present?
      user.income += user.fintoc_account.income
      user.expense += user.fintoc_account.expense
    end
    if user.fintual_account.present?
      user.investments_return += user.fintual_account.investments_return
    end
    if user.buda_account.present?
      user.investments_return += user.buda_account.investments_return
    end
  end
end

