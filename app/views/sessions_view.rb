class SessionsView
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
end
