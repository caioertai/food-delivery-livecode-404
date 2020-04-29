require_relative "base_repository"
require_relative "../models/meal"

class MealRepository < BaseRepository
  private

  def build_element(attributes)
    attributes[:id]    = attributes[:id].to_i
    attributes[:price] = attributes[:price].to_i
    Meal.new(attributes)
  end
end
