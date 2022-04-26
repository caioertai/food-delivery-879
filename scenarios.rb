require_relative "app/repositories/customer_repository"

CUSTOMER_CSV_PATH = "data/customers.csv"
customer_repository = CustomerRepository.new(CUSTOMER_CSV_PATH)

p customer_repository
