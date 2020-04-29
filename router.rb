class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @current_user = nil
    @running = true
  end

  def run
    puts "Welcome to Food Delivery App"
    while @running
      while @current_user.nil?
        @current_user = @sessions_controller.login
      end

      @current_user.manager? ? display_manager_menu : display_dg_menu
      display_common_menu
      user_action = gets.chomp.to_i
      print `clear`
      @current_user.manager? ? dispatch_manager(user_action) : dispatch_dg(user_action)
    end
  end

  private

  def display_dg_menu
    puts "Here are the options. Type [1,2]:"
    puts "1. Mark my orders as delivered"
    puts "2. List all my undelivered orders"
  end

  def display_manager_menu
    puts "Here are the options. Type [1,2,3,4]:"
    puts "1. Add a Meal"
    puts "2. List Meals"
    puts "3. Add Customer"
    puts "4. List Customers"
  end

  def display_common_menu
    puts "9. To logout"
    puts "0. To quit"
  end

  def dispatch_manager(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then @current_user = nil
    when 0 then @running = false
    end
  end

  def dispatch_dg(action)
    case action
    when 1 then puts "TODO!"
    when 2 then puts "TODO!"
    when 9 then @current_user = nil
    when 0 then @running = false
    end
  end
end
