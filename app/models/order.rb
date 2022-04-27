class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  # order, of a meal, to a customer, to be delivered by an employee
  def initialize(attributes = {})
    @id        = attributes[:id]
    @meal      = attributes[:meal]     # Meal instance
    @customer  = attributes[:customer] # Customer instance
    @employee  = attributes[:employee] # Employee instance
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
