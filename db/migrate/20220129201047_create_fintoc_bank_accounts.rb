class CreateFintocBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :fintoc_bank_accounts do |t|
      t.string :account_id
      t.string :name
      t.string :official_name
      t.string :holder_id, null: false
      t.string :holder_name, null: false
      t.string :type
      t.string :currency, null: false
      t.string :number, null: false
      t.decimal :balance, precision: 14, scale: 2
      t.references :fintoc_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
