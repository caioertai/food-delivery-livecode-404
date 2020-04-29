class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id] # Integer
    @customer = attributes[:customer] # Customer
    @meal = attributes[:meal] # Meal
    @employee = attributes[:employee] # Employee
    @delivered = attributes[:delivered] || false # true/false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end
