require_relative "app/repositories/order_repository"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"


meal_repository = MealRepository.new("data/meals.csv")
customer_repository = CustomerRepository.new("data/customers.csv")
employee_repository = EmployeeRepository.new("data/employees.csv")
order_repository = OrderRepository.new("data/orders.csv", meal_repository, customer_repository, employee_repository)
p order_repository.all
