class CartItemsController < ApplicationController
  def index
    if session[:cart]
      @cart_items = Cart.new(session[:cart])
    else
      @cart_items = Cart.new()
    end
  end

  def create

    redirect_to root_path
  end
end
