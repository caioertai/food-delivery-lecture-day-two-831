class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def initialize(attrs = {})
    @id = attrs[:id]
    @meal = attrs[:meal] # meal
    @customer = attrs[:customer] # customer
    @employee = attrs[:employee] # employee
    @delivered = attrs[:delivered] || false # delivered
  end

  def delivered?
    @delivered # boolean true/false
  end

  def deliver!
    @delivered = true
  end
end
