class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    # Data
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
