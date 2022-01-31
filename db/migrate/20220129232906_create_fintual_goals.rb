class CreateFintualGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :fintual_goals do |t|
      t.string :name
      t.date :creation_date
      t.decimal :deposited, precision: 14, scale: 2
      t.decimal :current, precision: 14, scale: 2
      t.decimal :profit, precision: 14, scale: 2
      t.string :currency, null: false, default: "CLP"
      t.references :fintual_account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
