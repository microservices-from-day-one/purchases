module V1
  class CartResource < JSONAPI::Resource
    attributes :cart_id, :expires_at, :total, :items_count

    has_many :items
  end
end
