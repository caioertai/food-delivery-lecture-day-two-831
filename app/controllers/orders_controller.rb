require_relative "../views/orders_view"
require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def add
    # ASK MEALS REPO for all meals
    # ASK MEALS VIEW to show them
    # ASK VIEW for an index
    # GET the instance from the meals array
    meals = @meal_repository.all
    @meals_view.display(meals)
    meal_index = @orders_view.ask_user_for_index
    meal = meals[meal_index]

    # ASK EMPLOYEE REPO for all employees
    # ASK EMPLOYEE VIEW to show them
    # ASK VIEW for an index
    # GET the instance from the employees array
    riders = @employee_repository.all_riders
    @employees_view.display(riders)
    rider_index = @orders_view.ask_user_for_index
    rider = riders[rider_index]

    # ASK CUSTOMER REPO for all customers
    # ASK CUSTOMER VIEW to show them
    # ASK VIEW for an index
    # GET the instance from the customers array
    customers = @customer_repository.all
    @customers_view.display(customers)
    customer_index = @orders_view.ask_user_for_index
    customer = customers[customer_index]

    # ASK Order to Instantiate an order with (meal, employee, customer)
    new_order = Order.new(meal: meal, employee: rider, customer: customer)
    # ASK ORDERS REPO to save it
    @order_repository.create(new_order)
  end

  def undelivered_orders
    orders = @order_repository.undelivered_orders
    @orders_view.display(orders)
  end

  def mark_as_delivered(current_user)
    orders = current_user.undelivered_orders
    @orders_view.display(orders)
    order_index = @orders_view.ask_user_for_index
    orders[order_index].deliver!
    @order_repository.persist!
  end

  def list_my_undelivered(current_user)
    orders = current_user.undelivered_orders
    @orders_view.display(orders)
  end
end
