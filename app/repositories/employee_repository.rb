require "csv"

require_relative "base_repository"
require_relative "../models/employee"

class EmployeeRepository < BaseRepository
  undef add

  def all_delivery_guys
    @elements.select { |employee| employee.delivery_guy? }
  end

  def find(id)
    @elements.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  private

  def next_id
    @elements.empty? ? 1 : @elements.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << %w[id username password role]
      @elements.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
  end
end
