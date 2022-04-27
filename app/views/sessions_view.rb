class SessionsView
  def ask_for_string(label)
    puts label
    gets.chomp
  end

  def wrong_credentials
    puts "Username and password aren't a match. Try again."
  end

  def welcome_employee(employee)
    puts "Welcome, #{employee.username}."
    puts "You're seeing the #{employee.role} menu!"
  end
end
