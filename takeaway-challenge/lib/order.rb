require_relative 'dish'
require_relative 'menu'

class Order
  attr_accessor :selection

  def initialize(menu, io = $stdout)
    @menu = menu
    @selection = []
    @io = io
  end

  def take_order
    loop do
      @io.puts "Select the number of the dish you'd like to order and press return. When you're done, press return again"
      order_no = @io.gets.chomp
      break if order_no.empty?

      index = order_no.to_i - 1
      if index >= 0 && index < @menu.dishes.count
        @selection << @menu.dishes[index]
      else
        @io.puts "Invalid dish number. Please try again."
      end

      @io.puts "You have ordered:"
      @selection.each do |dish|
        @io.puts dish.item
      end
    end
  end
end



# menu = Menu.new
# dish_one = Dish.new("Margharita", 10.00)
# dish_two = Dish.new("Calzone", 12.00)
# menu.add_dish(dish_one)
# menu.add_dish(dish_two)
# order = Order.new(menu)
# order.take_order
# order.menu 
# order.menu.dishes 
# order.menu.dishes[0]
# order.menu.dishes[0].item