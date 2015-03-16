require_relative '../test_helper'

class DisplaysItemsTest < ActionDispatch::IntegrationTest

  def setup
    Capybara.app = Storedom::Application
  end

  def test_it_reaches_the_root_page
    visit '/'
    assert_equal 200, page.status_code

    within('h1') do
      assert page.has_content?('Items'), "page should have an Items heading"
    end
  end

  def test_items_have_cart_buttons
    4.times { |i| Item.create(name: "thing#{i}", description: "stuff you want to buy")}

    visit '/'

    within first('.item-listing') do
      assert page.has_button?("Add to Cart")
    end
  end
end
