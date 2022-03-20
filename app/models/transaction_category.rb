class TransactionCategory < ApplicationRecord
  include ActiveModel::Serialization
  has_many :transactions, dependent: :nullify
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }
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
#  user_id     :bigint(8)        not null
#
# Indexes
#
#  index_transaction_categories_on_user_id  (user_id)
#
