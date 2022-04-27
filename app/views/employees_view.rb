class EmployeesView
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} - #{employee.role}"
    end
  end

  def ask_for_string(label)
    puts label
    gets.chomp
  end

  def ask_for_integer(label)
    puts label
    gets.chomp.to_i
  end
end
