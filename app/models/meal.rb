class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    # Data
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
