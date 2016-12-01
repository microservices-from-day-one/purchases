class ItemsController < ApplicationController
  before_filter :load_cart

  # POST /carts/:cart_id/items
  def create
    item = @cart.items.create(item_params)

    if item.save
      # TODO: updating cart totals is a code smell, move to a service class or AR callback
      @cart.reload.update_totals!
      render json: @cart, status: :created
    else
      render json: item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /carts/:cart_id/items
  def destroy
    Item.delete_all(cart_id: params[:cart_id], item_id: params[:id])
    # TODO: updating cart totals is a code smell, move to a service class or AR callback
    @cart.reload.update_totals!

    render nothing: true, status: :ok
  end

  def load_cart
    @cart = Cart.find(params[:cart_id])
  end
  private :load_cart

  def item_params
    params.require(:item).permit(:item_id, :quantity, :price)
  end
  private :item_params
end
