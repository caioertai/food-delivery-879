require_relative "app/repositories/employee_repository"

EMPLOYEE_CSV_PATH = "data/employees.csv"
employee_repository = EmployeeRepository.new(EMPLOYEE_CSV_PATH)

p employee_repository
