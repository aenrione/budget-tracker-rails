class ToBuyList < ApplicationRecord
  has_many :to_buy_items, dependent: :destroy
  alias_attribute :items, :to_buy_items
  belongs_to :user

  def total
    amount = Money.new(0)
    items.each {|i| amount += i.price_amount} 
    amount
  end
end

# == Schema Information
#
# Table name: to_buy_lists
#
#  id          :bigint(8)        not null, primary key
#  title       :string
#  description :string
#  user_id     :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_to_buy_lists_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
