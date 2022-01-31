class BudaCurrency < ApplicationRecord
  belongs_to :buda_account
  monetize :current, as: "current_amount", with_model_currency: :currency
  monetize :frozen_amount, as: "frozen_money_amount", with_model_currency: :currency
  monetize :pending, as: "pending_amount", with_model_currency: :currency
  monetize :available, as: "available_amount", with_model_currency: :currency
end

# == Schema Information
#
# Table name: buda_currencies
#
#  id              :bigint(8)        not null, primary key
#  available       :decimal(, )
#  current         :decimal(, )
#  frozen_amount   :decimal(, )
#  pending         :decimal(, )
#  currency        :string           not null
#  buda_account_id :bigint(8)        not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_buda_currencies_on_buda_account_id  (buda_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (buda_account_id => buda_accounts.id)
#
