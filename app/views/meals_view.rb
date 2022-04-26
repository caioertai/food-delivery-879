class MealsView
  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - $#{meal.price}"
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
