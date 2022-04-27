class Employee
  attr_accessor :id
  attr_reader :username, :password, :role, :orders

  def initialize(attributes = {})
    @id       = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role     = attributes[:role]
    @orders   = []
  end

  def undelivered_orders
    orders.reject(&:delivered?)
  end

  def assign_order(new_order)
    @orders << new_order
  end

  def password_match?(password_check)
    @password == password_check # true / false
  end

  def rider?
    @role == "rider"
  end

  def manager?
    @role == "manager"
  end
end


