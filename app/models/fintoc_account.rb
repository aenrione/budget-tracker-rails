class FintocAccount < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  belongs_to :user
  def email_required?
    false
  end

  def will_save_change_to_email?; end
end

# == Schema Information
#
# Table name: fintoc_accounts
#
#  id                     :bigint(8)        not null, primary key
#  encrypted_password     :string           default(""), not null
#  link                   :string           not null
#  account_name           :string           default("Fintoc"), not null
#  balance                :decimal(14, 2)   default(0.0), not null
#  user_id                :bigint(8)        not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_fintoc_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#  index_fintoc_accounts_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
