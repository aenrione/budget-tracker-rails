class FintualAccount < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  belongs_to :user
  has_many :fintual_goals, dependent: :destroy
  monetize :balance, as: "balance_amount"
  monetize :investments_return, as: "return_amount"
  has_paper_trail on: [:update],
                  only: [:balance, :investments_return],
                  if: Proc.new { |t|
                        t.versions.length.zero? ? true : t.updated_at >= t.versions.last.created_at + 1.week
                      }

  def email_required?
    false
  end

  def will_save_change_to_email?; end
end

# == Schema Information
#
# Table name: fintual_accounts
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  account_name           :string           default("Fintual"), not null
#  balance                :decimal(14, 2)   default(0.0), not null
#  user_id                :bigint(8)        not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  investments_return     :decimal(14, 2)   default(0.0)
#
# Indexes
#
#  index_fintual_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#  index_fintual_accounts_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
