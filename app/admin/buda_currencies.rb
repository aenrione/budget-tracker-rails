ActiveAdmin.register BudaCurrency do
  menu parent: "Config"

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :available, :current, :frozen_amount, :pending, :currency, :buda_account_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:available, :current, :frozen_amount, :pending, :currency, :buda_account_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
