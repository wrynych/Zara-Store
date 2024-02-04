class Item
  attr_accessor :name, :availability, :price

  def initialize(name, availability, price)
    @name = name
    @availability = availability
    @price = price
  end

  def to_s
    "#{@name.capitalize}: Availability - #{@availability}, Price - $#{@price}"
  end
end
