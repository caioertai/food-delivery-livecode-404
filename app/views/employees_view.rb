class EmployeesView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_employees(employees)
    employees.each do |employee|
      puts "#{employee.id}. #{employee.username}"
    end
  end
end
