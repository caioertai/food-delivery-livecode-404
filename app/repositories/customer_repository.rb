require "csv"

require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_path)
    @csv_path = csv_path
    @customers = []
    load_csv if File.exist?(csv_path)
  end

  def add(new_customer)
    new_customer.id = next_id
    @customers << new_customer
    update_csv
  end

  def all
    @customers
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  private

  def next_id
    @customers.empty? ? 1 : @customers.last.id + 1
  end

  def update_csv
    CSV.open(@csv_path, "wb") do |csv|
      csv << %w[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, csv_options) do |row|
      # row { id: "2", name: "Ringo", address: "Liverpool" }
      row[:id]    = row[:id].to_i
      # row { id: 2, name: "Ringo", address: "Liverpool" }
      @customers << Customer.new(row)
    end
  end
end
