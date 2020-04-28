require "csv"

class MealRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @meals = []
    load_csv if File.exist?(csv_path)
  end

  def add(new_meal)
    new_meal.id = next_id
    @meals << new_meal
    update_csv
  end

  def all
    @meals
  end

  private

  def next_id
    @meals.empty? ? 1 : @meals.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id]    = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
  end
end
