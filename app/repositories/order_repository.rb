require "pry-byebug"
require "csv"

require_relative "../models/order"

class OrderRepository
  def initialize(csv_path, meal_repository, customer_repository, employee_repository)
    @csv_path = csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    load_csv if File.exist?(csv_path)
  end

  def add(new_order)
    new_order.id = next_id
    @orders << new_order
    update_csv
  end

  def all
    @orders
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def mark_as_delivered(id)
    order = find(id)
    order.deliver!
    update_csv
  end

  private

  def next_id
    @orders.empty? ? 1 : @orders.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << %w[id customer_id meal_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.customer.id, order.meal.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == "true"
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)

      employee = @employee_repository.find(row[:employee_id].to_i)
      row[:employee] = employee

      order = Order.new(row)
      employee.add_order(order)
      @orders << order
    end
  end
end
