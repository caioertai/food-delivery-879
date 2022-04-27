class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @current_user = nil
    @running = true
  end

  def run
    puts "Welcome to the Food Delivery"
    authenticate_employee until @current_user
    while @running
      @current_user.manager? ? display_manager_menu : display_rider_menu
      print "> "
      user_input = gets.chomp.to_i
      print `clear`
      @current_user.manager? ? dispatch_manager(user_input) : dispatch_rider(user_input)
      puts "----------"
    end
  end

  private

  def authenticate_employee
    @current_user = @sessions_controller.login
  end

  def display_rider_menu
    puts "1. See undelivered orders assigned to me"
    puts "2. Mark an undelivered order assigned to me as delivered"
    puts "0. To quit"
  end

  def display_manager_menu
    puts "1. List meals"
    puts "2. Add a Meal"
    puts "3. List customers"
    puts "4. Add customer"
    puts "5. Add an order"
    puts "0. To quit"
  end

  def dispatch_rider(user_input)
    case user_input
    when 1 then @orders_controller.list_my_orders(@current_user)
    when 2 then @orders_controller.mark_as_delivered(@current_user)
    when 0 then stop
    end
  end

  def dispatch_manager(user_input)
    case user_input
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.add
    when 0 then stop
    else
      puts "Wrong option (not a valid number)"
    end
  end

  def stop
    @running = false
  end
end
