class OrdersView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_orders(orders)
    orders.each do |order|
      puts "Order ##{order.id}"
      puts "Customer:     #{order.customer.name}"
      puts "Delivery Guy: #{order.employee.username}"
      puts "Meal:         #{order.meal.name}"
      puts "-------"
    end
  end
end
