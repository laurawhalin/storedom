class Cart
  attr_reader :data

  def initialize
    @data = Hash.new(0)
  end

  def add_item(id)
    @data[id] += 1
  end
end
