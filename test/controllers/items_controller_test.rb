require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @cart = Cart.new
    @cart.save!
  end

  test "should add item to cart" do
    assert_difference('Item.count') do
      post :create, cart_id: @cart.cart_id,
                    item: {
                      item_id: SecureRandom.uuid,
                      quantity: 1,
                      price: 100
                    },
                    format: :json
    end

    assert_response :success
    assert json_response
  end

  test "should remove item from cart" do
    item = add_item_to_cart
    assert_difference('Item.count', -1) do
      delete :destroy, cart_id: @cart.cart_id, id: item["item_id"], format: :json
    end

    assert_response :success
  end

  def add_item_to_cart
    item = {
      item_id: SecureRandom.uuid,
      quantity: 1,
      price: 100
    }
    @cart.items.create(item)
  end
end
