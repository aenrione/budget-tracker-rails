class AddIncomeExpenseAndInvestmentsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :income, :decimal, precision: 14, scale: 2, default: 0
    add_column :users, :expense, :decimal, precision: 14, scale: 2, default: 0
    add_column :users, :investments_return, :decimal, precision: 14, scale: 2, default: 0

    add_column :fintoc_bank_accounts, :income, :decimal, precision: 14, scale: 2, default: 0
    add_column :fintoc_bank_accounts, :expense, :decimal, precision: 14, scale: 2, default: 0

    add_column :fintoc_accounts, :income, :decimal, precision: 14, scale: 2, default: 0
    add_column :fintoc_accounts, :expense, :decimal, precision: 14, scale: 2, default: 0

    add_column :buda_accounts, :investments_return, :decimal, precision: 14, scale: 2, default: 0

    add_column :fintual_accounts, :investments_return, :decimal, precision: 14, scale: 2, default: 0
  end
end
