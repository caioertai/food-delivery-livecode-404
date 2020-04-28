class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to Food Delivery App"
    while @running
      display_menu
      user_action = gets.chomp.to_i
      print `clear`
      dispatch(user_action)
    end
  end

  private

  def display_menu
    puts "Here are the options. Type [1,2,3,4]:"
    puts "1. Add a Meal"
    puts "2. List Meals"
    puts "3. Add Customer"
    puts "4. List Customers"
    puts "0. To quit"
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 0 then @running = false
    end
  end
end
