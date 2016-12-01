module V1
  class ItemResource < JSONAPI::Resource
    attributes :item_id, :quantity, :price

    def id
      item_id
    end
  end
end
