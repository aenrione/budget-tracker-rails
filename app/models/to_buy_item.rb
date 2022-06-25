class ToBuyItem < ApplicationRecord
  belongs_to :to_buy_list
  monetize :price, as: "price_amount"
end

# == Schema Information
#
# Table name: to_buy_items
#
#  id             :bigint(8)        not null, primary key
#  title          :string
#  description    :string
#  price          :decimal(14, 2)
#  to_buy_list_id :bigint(8)        not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_to_buy_items_on_to_buy_list_id  (to_buy_list_id)
#
# Foreign Keys
#
#  fk_rails_...  (to_buy_list_id => to_buy_lists.id)
#
