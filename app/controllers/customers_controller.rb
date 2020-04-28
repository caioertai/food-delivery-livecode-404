require_relative "../models/customer"
require_relative "../views/view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = View.new
  end

  def add
    # Ask VIEW to ask user for a name
    customer_name = @view.ask_for_name
    # Ask VIEW to ask user for a address
    customer_address = @view.ask_for_address
    # Ask MODEL to instantiate
    new_customer = Customer.new(name: customer_name, address: customer_address)
    # Ask REPO to save
    @customer_repository.add(new_customer)
  end

  def list
    # Ask REPO for the customers
    customers = @customer_repository.all
    # Ask VIEW to show them
    @view.display_customers(customers)
  end
end
