class Transaction < ApplicationRecord
  belongs_to :fintoc_bank_account, optional: true
  belongs_to :transaction_category, optional: true
  monetize :amount, as: "transaction_amount"
end

# == Schema Information
#
# Table name: transactions
#
#  id                      :bigint(8)        not null, primary key
#  amount                  :decimal(14, 2)
#  comment                 :text
#  currency                :string
#  description             :string
#  transaction_id          :string
#  post_date               :date
#  transaction_date        :date
#  transaction_type        :string
#  holder_id               :string
#  holder_name             :string
#  holder_institution      :string
#  fintoc_bank_account_id  :bigint(8)
#  transaction_category_id :bigint(8)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#
# Indexes
#
#  index_transactions_on_fintoc_bank_account_id   (fintoc_bank_account_id)
#  index_transactions_on_transaction_category_id  (transaction_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (fintoc_bank_account_id => fintoc_bank_accounts.id)
#  fk_rails_...  (transaction_category_id => transaction_categories.id)
#
