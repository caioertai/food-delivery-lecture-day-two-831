class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} to #{order.customer.name} by #{order.employee.username}"
    end
  end

  def ask_user_for_index
    puts "Which one (by number)?"
    print "> "
    return gets.chomp.to_i - 1
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
