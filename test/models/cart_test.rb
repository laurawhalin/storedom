require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "cart without items is an empty hash" do
    cart = Cart.new
    hash = {}

    assert_equal hash, cart.data
  end

  test "items can be added to cart" do
    item = Item.create(name: "blah", description: "dblah")
    cart = Cart.new
    cart.add_item(item.id)

    assert_equal 1, cart.data[item.id]
  end
end
