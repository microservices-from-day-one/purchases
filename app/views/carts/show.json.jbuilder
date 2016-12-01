json.extract! @cart, :cart_id, :expires_at, :total, :items_count
json.items @cart.items, :item_id, :quantity, :price, :total
