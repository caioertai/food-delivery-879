class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} to #{order.customer.name} by #{order.employee.username}"
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

  def ask_for_index
    puts "Which one (by number)?"
    gets.chomp.to_i - 1
  end
end
