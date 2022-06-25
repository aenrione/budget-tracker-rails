class CreateToBuyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :to_buy_items do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 14, scale: 2
      t.references :to_buy_list,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
