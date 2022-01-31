class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_paper_trail on: [:update],
                  only: [:balance]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :fintoc_account, dependent: :destroy
  has_one :fintual_account, dependent: :destroy
  has_one :buda_account, dependent: :destroy
  monetize :balance, as: "balance_amount"
  monetize :income, as: "income_amount"
  monetize :expense, as: "expense_amount"
  monetize :investments_return, as: "investments_amount"

  def confirmation_required?
    false
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#  balance                :decimal(14, 2)   default(0.0)
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :text
#  income                 :decimal(14, 2)   default(0.0)
#  expense                :decimal(14, 2)   default(0.0)
#  investments_return     :decimal(14, 2)   default(0.0)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
