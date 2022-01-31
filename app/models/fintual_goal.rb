class FintualGoal < ApplicationRecord
  belongs_to :fintual_account
  monetize :current, as: "current_amount"
  monetize :deposited, as: "deposited_amount"
  monetize :profit, as: "profit_amount"
end

# == Schema Information
#
# Table name: fintual_goals
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  creation_date      :date
#  deposited          :decimal(14, 2)
#  current            :decimal(14, 2)
#  profit             :decimal(14, 2)
#  currency           :string           default("CLP"), not null
#  fintual_account_id :bigint(8)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_fintual_goals_on_fintual_account_id  (fintual_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (fintual_account_id => fintual_accounts.id)
#
