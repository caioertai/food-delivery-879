require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    # Ask REPO for all meals
    meals = @meal_repository.all
    # Ask VIEW to display them
    @meals_view.display(meals)
  end

  def add
    # Ask VIEW to ask user for name (string)
    meal_name = @meals_view.ask_for_string("What is the name?")
    # Ask VIEW to ask user for price (integer)
    meal_price = @meals_view.ask_for_integer("What is the price?")
    # Ask MEAL to instantiate a meal
    new_meal = Meal.new(name: meal_name, price: meal_price)
    # Ask REPO to persist it
    @meal_repository.create(new_meal)
  end
end
