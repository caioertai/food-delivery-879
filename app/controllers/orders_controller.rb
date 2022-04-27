require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def add
    # Ask MEAL REPO for all meals
    # Ask MEALS VIEW to list them
    # Ask VIEW to ask user for the index of the meal
    # Get from array the MEAL of that index
    meals = @meal_repository.all
    @meals_view.display(meals)
    meal_index = @orders_view.ask_for_index
    meal = meals[meal_index]

    # Ask CUSTOMER REPO for all CUSTOMERs
    # Ask CUSTOMERS VIEW to list them
    # Ask VIEW to ask user for the index of the customer
    # Get from array the CUSTOMER of that index
    customers = @customer_repository.all
    @customers_view.display(customers)
    customer_index = @orders_view.ask_for_index
    customer = customers[customer_index]

    # Ask EMPLOYEE REPO for all EMPLOYEEs
    # Ask EMPLOYEES VIEW to list them
    # Ask VIEW to ask user for the index of the employee
    # Get from array the EMPLOYEE of that index
    employees = @employee_repository.all_riders
    @employees_view.display(employees)
    employee_index = @orders_view.ask_for_index
    employee = employees[employee_index]

    # Ask MODEL for an instance of the order
    new_order = Order.new(meal: meal, employee: employee, customer: customer)
    # Ask ORDER REPO to persist it
    @order_repository.create(new_order)
  end

  def mark_as_delivered(current_user)
    # Ask current user for its orders
    user_orders = current_user.undelivered_orders
    # Ask ORDERS VIEW to display
    @orders_view.display(user_orders)
    # Ask orders view for an index
    order_index = @orders_view.ask_for_index
    # Get that order from the array
    order_to_mark = user_orders[order_index]
    # Ask ORDER INSTANCE to mark itself
    order_to_mark.deliver!
    # Ask ORDER REPO to persist the changes
    @order_repository.persist!
  end

  def list_my_orders(current_user)
    user_orders = current_user.undelivered_orders
    # Ask ORDERS VIEW to display them
    @orders_view.display(user_orders)
  end
end
