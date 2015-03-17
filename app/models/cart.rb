class Cart
  attr_reader :data

  def initialize
    @data = Hash.new(0)
  end

  def add_item(id)
    item = Item.find(id)
    @data[item] += 1
  end
end
