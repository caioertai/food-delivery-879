require_relative "../views/customers_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @customers_view.display(customers)
  end

  def add
    customer_name = @customers_view.ask_for_string("What's the name?")
    customer_address = @customers_view.ask_for_string("What's the address?")
    new_customer = Customer.new(name: customer_name, address: customer_address)
    @customer_repository.create(new_customer)
  end
end
