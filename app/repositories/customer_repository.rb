require "csv"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @customers = []

    load_csv
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  def create(new_customer)
    new_customer.id = next_id
    @customers << new_customer
    update_csv
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv_file|
      csv_file << %w[id name address]
      @customers.each do |customer|
        csv_file << [customer.id, customer.name, customer.address]
      end
    end
  end

  def next_id
    @customers.empty? ? 1 : @customers.last.id + 1
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # Type cast
      row[:id] = row[:id].to_i

      @customers << Customer.new(row)
    end
  end
end
