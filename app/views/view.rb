class View
  def ask_for_name
    puts "What's the name?"
    print "> "
    gets.chomp
  end

  def ask_for_address
    puts "What's the address?"
    print "> "
    gets.chomp
  end

  def ask_for_price
    puts "What's the price?"
    print "> "
    gets.chomp.to_i
  end

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} $#{meal.price}"
    end
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} #{customer.address}"
    end
  end
end
