require_relative "../models/meal"
require_relative "../views/view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = View.new
  end

  # Actions
  def add
    # Ask for the name
    meal_name = @view.ask_for_name
    # Ask for the price
    meal_price = @view.ask_for_price
    # Initializing the meal with the params
    new_meal = Meal.new(name: meal_name, price: meal_price)
    # Ask repo to hold the meal
    @meal_repository.add(new_meal)
  end

  def list
    # Ask REPO for the meals
    meals = @meal_repository.all
    # Ask VIEW to list meals
    @view.display_meals(meals)
  end
end
