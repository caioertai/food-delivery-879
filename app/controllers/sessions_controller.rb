require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new
  end

  def login
    ##### CREATE / LOGIN
    # Ask VIEW to user for a username
    # username = @sessions_view.ask_for_string("What's your username?")
    username = "rafael"
    # Ask VIEW to user for a password
    # password = @sessions_view.ask_for_string("What's your password?")
    password = "another"
    # Ask REPO for the user of that username
    employee = @employee_repository.find_by_username(username)

    # If the user exists and the password matches, return employee
    # If not... return nil
    # Or in ternary operator:
    # employee.password_match?(password) ? employee : nil
    if employee != nil && employee.password_match?(password)
      @sessions_view.welcome_employee(employee)
      return employee
    else
      @sessions_view.wrong_credentials
      return nil
    end
  end
end
