class Cart < ActiveRecord::Base
  before_create :set_attributes
  has_many :items

  self.primary_key = "cart_id"

  def update_totals!
    self.items_count = self.items.size
    self.total = self.items.map(&:total).sum
    self.save
  end

  def set_attributes
    self.cart_id = SecureRandom.uuid
    self.expires_at = 4.weeks.from_now
    self.items_count = 0
    self.total = 0
  end
end
