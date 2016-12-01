class Item < ActiveRecord::Base
  belongs_to :cart

  self.primary_key = "item_id, cart_id"

  def total
    price * quantity
  end
end
