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

    assert_equal 1, cart.data[item]
  end

  test "two of the same item can be added to cart" do
    item = Item.create(name: "blah", description: "dblah")
    cart = Cart.new
    cart.add_item(item.id)
    cart.add_item(item.id)

    assert_equal 2, cart.data[item]
  end

  test "different items can be added to the cart" do
    item = Item.create(name: "blah", description: "dblah")
    item2 = Item.create(name: "blahzeh", description: "dblah blah")
    cart = Cart.new
    cart.add_item(item.id)
    cart.add_item(item2.id)

    assert_equal 2, cart.data.count
    assert_equal 1, cart.data[item]
    assert_equal 1, cart.data[item2]
  end

  test "cart contains quantity and item object" do
    item = Item.create(name: "blah", description: "dblah")
    cart = Cart.new
    cart.add_item(item.id)

    assert_equal 1, cart.data[item]
  end

  test "adding item to cart updates session cart" do
    item = Item.create(name: "blah", description: "dhslkfjd")
    cart = Cart.new
    cart.add_item(item.id)
    result = cart.update_session_cart
    item_id = item.id
    expected_hash = { item_id => 1 }

    assert_equal expected_hash, result
  end
end
