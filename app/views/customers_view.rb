class CustomersView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id}. #{customer.name} #{customer.address}"
    end
  end
end
