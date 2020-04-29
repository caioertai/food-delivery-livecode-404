class View
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def login_error
    puts "Sorry, wrong credentials. Try again."
  end

  def login_success(employee)
    puts "Welcome, #{employee.username}."
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
