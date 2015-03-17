class Cart
  attr_reader :data

  def initialize(cart=Hash.new(0))
    @data = cart
  end

  def add_item(id)
    item = Item.find(id)
    @data[item] += 1
  end

  def update_session_cart
    
  end
end
