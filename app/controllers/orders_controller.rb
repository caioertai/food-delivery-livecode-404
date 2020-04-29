require_relative "../models/order"

require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"
require_relative "../views/orders_view"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @employee_repository = employee_repository
    @customer_repository = customer_repository
    @order_repository = order_repository

    @meals_view = MealsView.new
    @employees_view = EmployeesView.new
    @customers_view = CustomersView.new
    @orders_view = OrdersView.new
  end

  def list_my_orders(current_user)
    orders = current_user.undelivered_orders
    @orders_view.display_orders(orders)
  end

  def mark_as_delivered(current_user)
    # Ask REPO for orders of the current user
    orders = current_user.undelivered_orders
    # orders = @order_repository.undelivered.select { |order| order.employee == current_user }
    # Ask VIEW to display the orders
    @orders_view.display_orders(orders)
    # Ask VIEW for the id
    order_index = @orders_view.ask_for("number of the order").to_i - 1
    # Ask REPO to mark the given id as delivered
    @order_repository.mark_as_delivered(orders[order_index].id)
  end

  def list_undelivered_orders
    # Ask ORDERS REPO for undelivered
    orders = @order_repository.undelivered_orders
    # Ask ORDERS view TO DISPLAY THEM
    @orders_view.display_orders(orders)
  end

  def add
    picked_meal = select_meal
    picked_customer = select_customer
    picked_delivery_guy = select_delivery_guy
    # Ask ORDER to instantiate a new order
    order = Order.new(meal: picked_meal, customer: picked_customer, employee: picked_delivery_guy)
    # Ask REPO to save it
    @order_repository.add(order)
  end

  private

  def select_meal
    # Ask MEALS REPO for the meals
    meals = @meal_repository.all
    # Ask MEALS VIEW to display the meals
    @meals_view.display_meals(meals)
    # Ask VIEW for an id of the chosen meal
    meal_index = @meals_view.ask_for("meal number").to_i - 1
    # Take meal with the given index
    meals[meal_index]
  end

  def select_delivery_guy
    # Ask employeeS REPO for the employees
    employees = @employee_repository.all_delivery_guys
    # Ask employeeS VIEW to display the employees
    @employees_view.display_employees(employees)
    # Ask VIEW for an id of the chosen employee
    employee_index = @employees_view.ask_for("delivery guy number").to_i - 1
    # Take employee with the given index
    employees[employee_index]
  end

  def select_customer
    # Ask customerS REPO for the customers
    customers = @customer_repository.all
    # Ask customerS VIEW to display the customers
    @customers_view.display_customers(customers)
    # Ask VIEW for an id of the chosen customer
    customer_index = @customers_view.ask_for("customer number").to_i - 1
    # Take customer with the given index
    customers[customer_index]
  end
end
