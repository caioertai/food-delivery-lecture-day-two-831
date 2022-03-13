require "pry-byebug"
require_relative "app/repositories/order_repository"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"
require_relative "app/repositories/employee_repository"

meal_repository = MealRepository.new("data/meals.csv")
customer_repository = CustomerRepository.new("data/customers.csv")
employee_repository = EmployeeRepository.new("data/employees.csv")
order_repository = OrderRepository.new("data/orders.csv", meal_repository, customer_repository, employee_repository)

meal = meal_repository.find(4)
customer = customer_repository.find(2)
employee = employee_repository.find(3)

new_order = Order.new(meal: meal, customer: customer, employee: employee)

order_repository.create(new_order)
