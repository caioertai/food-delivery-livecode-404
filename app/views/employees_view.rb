class EmployeesView
  def ask_for(thing)
    puts "What's the #{thing}?"
    print "> "
    gets.chomp
  end

  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end
end
