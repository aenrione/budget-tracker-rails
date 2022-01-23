class AddBalanceAndNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :balance, :decimal, precision: 14, scale: 2, default: 0
  end
end
