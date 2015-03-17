class CartItemsController < ApplicationController
  def index
    #@cart_items = Cart.new(session[:cart])
  end

  def create
    redirect_to root_path
  end
end
