require "csv"

require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @employees = []
    load_csv if File.exist?(csv_path)
  end

  def add(new_employee)
    new_employee.id = next_id
    @employees << new_employee
    update_csv
  end

  def all
    @employees
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def next_id
    @employees.empty? ? 1 : @employees.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << %w[id username password role]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end
