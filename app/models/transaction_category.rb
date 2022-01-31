class TransactionCategory < ApplicationRecord
  has_many :transactions, dependent: :nullify
end

# == Schema Information
#
# Table name: transaction_categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
