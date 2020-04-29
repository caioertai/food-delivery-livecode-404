require_relative "base_repository"
require_relative "../models/customer"

class CustomerRepository < BaseRepository
  private

  def build_element(attributes)
    attributes[:id] = attributes[:id].to_i
    Customer.new(attributes)
  end
end
