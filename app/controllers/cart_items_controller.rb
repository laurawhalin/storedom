class CartItemsController < ApplicationController
  def index
    if session[:cart]
      @cart_items = Cart.new(session[:cart])
    else
      @cart_items = Cart.new()
    end
  end

  def create
    cart = Cart.new(session[:cart])
    cart.add_item(params[:id])
    # cart.update_session_cart
    redirect_to root_path
  end
end
