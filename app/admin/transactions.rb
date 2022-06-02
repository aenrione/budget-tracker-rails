ActiveAdmin.register Transaction do
  menu parent: "Config"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :amount, :comment, :currency, :description, :transaction_id, :post_date, :transaction_date, :transaction_type, :holder_id, :holder_name, :holder_institution, :fintoc_bank_account_id, :transaction_category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:amount, :comment, :currency, :description, :transaction_id, :post_date, :transaction_date, :transaction_type, :holder_id, :holder_name, :holder_institution, :fintoc_bank_account_id, :transaction_category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
