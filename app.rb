require_relative "app/repositories/meal_repository"
require_relative "app/controllers/meals_controller"
require_relative "router"

MEAL_CSV_PATH = "data/meals.csv"
meal_repository = MealRepository.new(MEAL_CSV_PATH)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller)
router.run