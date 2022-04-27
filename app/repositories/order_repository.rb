require "csv"
require "pry-byebug"
require_relative "../models/order"

class OrderRepository
  def initialize(csv_file_path, meal_repository, customer_repository, employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []

    load_csv
  end

  def all
    @orders
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def create(new_order)
    new_order.id = next_id
    @orders << new_order
    update_csv
  end

  def all_from(employee)
    @orders.select { |order| order.employee == employee }
  end

  def persist!
    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv_file|
      csv_file << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv_file << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def next_id
    @orders.empty? ? 1 : @orders.last.id + 1
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # Type cast
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      row[:employee] = employee

      order = Order.new(row)
      employee.assign_order(order)

      @orders << order
    end
  end
end
