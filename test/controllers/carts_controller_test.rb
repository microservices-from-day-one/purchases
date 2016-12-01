require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  test "#create should add a new cart" do
    assert_difference('Cart.count') do
      post :create, cart: {  }, format: :json
    end

    assert_response :success
    assert json_response
  end

  test "#show should get cart details" do
    cart = Cart.new
    cart.save!

    get :show, id: cart.cart_id, format: :json

    assert_response :success
    assert json_response
  end

  test "#show should return a 404 for invalid cart" do
    get :show, id: "not-a-real-id", format: :json
    assert_response :not_found
  end
end
