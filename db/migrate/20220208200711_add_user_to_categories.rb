class AddUserToCategories < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :transaction_categories, :user, null: false, index: {algorithm: :concurrently }
  end
end
