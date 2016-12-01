class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  # GET /carts/:id
  def show
    @cart = Cart.find(params[:id])
    render :show
  end

  def record_not_found
    render nothing: true, status: :not_found
  end
end
