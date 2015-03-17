require 'test_helper'

class CartItemsTest < ActionDispatch::IntegrationTest
  test "empty cart has no items" do
    visit cart_items_path

    assert_equal '/cart_items', current_path
    assert page.has_content?("Your cart is empty!")
  end

  test "an item can be added to a cart" do
    4.times { |i| Item.create(name: "thing#{i}", description: "stuff you want to buy")}
    visit '/'
save_and_open_page
    within first(".item-listing") do
      click_link_or_button("Add to Cart")
    end
    within(".navbar") do
      click_button("Cart")
    end

    assert_equal '/cart_items', current_path
    within first(".cart-item") do
      within('.item') do
        assert page.has_content?('thing1')
      end
      within('.quantity') do
        assert page.has_content?('stuff you want to buy')
      end
    end
  end
end
