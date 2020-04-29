class CustomersView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} #{customer.address}"
    end
  end
end
