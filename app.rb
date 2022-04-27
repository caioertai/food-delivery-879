require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"

require_relative "app/controllers/customers_controller"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/sessions_controller"

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

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
