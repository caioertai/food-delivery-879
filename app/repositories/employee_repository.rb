require "csv"
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []

    load_csv
  end

  def all
    @employees
  end

  def create(new_employee)
    new_employee.id = next_id
    @employees << new_employee
    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv_file|
      csv_file << %w[id username role password]
      @employees.each do |employee|
        csv_file << [employee.id, employee.username, employee.role, employee.password]
      end
    end
  end

  def next_id
    @employees.empty? ? 1 : @employees.last.id + 1
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # Type cast
      row[:id] = row[:id].to_i

      @employees << Employee.new(row)
    end
  end
end
