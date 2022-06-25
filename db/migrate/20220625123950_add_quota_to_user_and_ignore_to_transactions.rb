class AddQuotaToUserAndIgnoreToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :quota, :decimal, precision: 14, scale: 2, default: 0
    add_column :transactions, :ignore, :boolean, default: false
  end
end
