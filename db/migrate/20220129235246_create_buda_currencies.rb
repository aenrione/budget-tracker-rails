class CreateBudaCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :buda_currencies do |t|
      t.decimal :available
      t.decimal :current
      t.decimal :frozen_amount
      t.decimal :pending
      t.string :currency, null: false
      t.references :buda_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
