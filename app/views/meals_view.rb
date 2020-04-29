class MealsView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} $#{meal.price}"
    end
  end
end
