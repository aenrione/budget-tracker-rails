class AddUserToken < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!

  def up
    safety_assured do
      change_table :users, bulk: true do |t|
        t.column :provider, :string, null: false, default: 'email'
        t.column :uid, :string, null: false, default: ''
        t.column :tokens, :text
      end
    end

    User.reset_column_information
    User.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end

    add_index :users, [:uid, :provider], unique: true, algorithm: :concurrently
  end

  def down
    remove_columns :users, :provider, :uid, :tokens
  end
end
