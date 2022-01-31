class FintocBankAccount < ApplicationRecord
  belongs_to :fintoc_account
  has_many :transactions, dependent: :destroy
  monetize :balance, as: "balance_amount"
  has_paper_trail on: [:update],
                  only: [:balance]
end

# == Schema Information
#
# Table name: fintoc_bank_accounts
#
#  id                :bigint(8)        not null, primary key
#  account_id        :string
#  name              :string
#  official_name     :string
#  holder_id         :string           not null
#  holder_name       :string           not null
#  type              :string
#  currency          :string           not null
#  number            :string           not null
#  balance           :decimal(14, 2)
#  fintoc_account_id :bigint(8)        not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  income            :decimal(14, 2)   default(0.0)
#  expense           :decimal(14, 2)   default(0.0)
#
# Indexes
#
#  index_fintoc_bank_accounts_on_fintoc_account_id  (fintoc_account_id)
#
# Foreign Keys
#
#  fk_rails_...  (fintoc_account_id => fintoc_accounts.id)
#
