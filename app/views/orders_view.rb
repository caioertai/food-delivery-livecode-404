class OrdersView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "Order ##{index + 1}\n
        Customer:     #{order.customer.name}
        Delivery Guy: #{order.employee.username}
        Meal:         #{order.meal.name}
      -------"
    end
  end
end
