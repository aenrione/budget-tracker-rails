ActiveAdmin.register FintocAccount do
  menu parent: "Cuentas"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :encrypted_password, :link, :account_name, :balance, :user_id, :reset_password_token, :reset_password_sent_at, :remember_created_at, :income, :expense
  #
  # or
  #
  # permit_params do
  #   permitted = [:encrypted_password, :link, :account_name, :balance, :user_id, :reset_password_token, :reset_password_sent_at, :remember_created_at, :income, :expense]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
