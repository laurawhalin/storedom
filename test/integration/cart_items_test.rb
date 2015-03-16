require 'test_helper'

class CartItemsTest < ActionDispatch::IntegrationTest

  test "empty cart has no items" do
    visit cart_items_path

    assert page.has_content?("Your cart is empty!")
  end
end
