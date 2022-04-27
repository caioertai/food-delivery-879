require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/order_repository"

require_relative "app/controllers/customers_controller"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/sessions_controller"
require_relative "app/controllers/orders_controller"

require_relative "router"

MEAL_CSV_PATH = "data/meals.csv"
meal_repository = MealRepository.new(MEAL_CSV_PATH)
meals_controller = MealsController.new(meal_repository)

CUSTOMER_CSV_PATH = "data/customers.csv"
customer_repository = CustomerRepository.new(CUSTOMER_CSV_PATH)
customers_controller = CustomersController.new(customer_repository)

EMPLOYEE_CSV_PATH = "data/employees.csv"
employee_repository = EmployeeRepository.new(EMPLOYEE_CSV_PATH)
sessions_controller = SessionsController.new(employee_repository)

ORDER_CSV_PATH = "data/orders.csv"
order_repository = OrderRepository.new(ORDER_CSV_PATH, meal_repository, customer_repository, employee_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)
router.run
