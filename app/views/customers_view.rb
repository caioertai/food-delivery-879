class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} - #{customer.address}"
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
