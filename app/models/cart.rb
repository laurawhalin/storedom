class Cart
  attr_reader :data

  def initialize(cart=Hash.new(0))
    if (cart.count > 0)
      @data = convert_cart(cart)
    else
      @data = cart
    end
  end

  def add_item(id)
    item = Item.find(id)
    @data[item] += 1
  end

  def convert_cart(cart)
    new_cart = {}
    cart.each do |item_id, quantity|
      item = Item.find(item_id)
      new_cart[item] = quantity
    end
    new_cart
  end
end
