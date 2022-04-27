require "csv"
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []

    load_csv
  end

  def all
    @meals
  end

  def create(new_meal)
    new_meal.id = next_id
    @meals << new_meal
    update_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def update_csv
    CSV.open(@csv_file_path, "wb") do |csv_file|
      csv_file << %w[id name price]
      @meals.each do |meal|
        csv_file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def next_id
    @meals.empty? ? 1 : @meals.last.id + 1
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: true, header_converters: :symbol) do |row|
      # Type cast
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i

      @meals << Meal.new(row)
    end
  end
end
