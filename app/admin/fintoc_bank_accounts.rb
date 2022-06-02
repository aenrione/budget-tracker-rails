ActiveAdmin.register FintocBankAccount do
  menu parent: "Cuentas"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :account_id, :name, :official_name, :holder_id, :holder_name, :type, :currency, :number, :balance, :fintoc_account_id, :income, :expense
  #
  # or
  #
  # permit_params do
  #   permitted = [:account_id, :name, :official_name, :holder_id, :holder_name, :type, :currency, :number, :balance, :fintoc_account_id, :income, :expense]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
