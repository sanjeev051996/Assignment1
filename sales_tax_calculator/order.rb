require_relative "order_processor"
require_relative "utility"
require_relative "item"

class Order < OrderProcessor

  include Utility
  #This method prompts the user to input the information about the transactions
  def get_input
    item_list = []
    puts "Enter no. of transactions"
    size = gets.chomp.to_i
    puts "Enter the information about transactions one by one"
    size.times { item_list << gets.chomp }
    item_list
  end

  def get_order_details(item_list)
    details_list = []
    item_list.each do |item|
      details_list << build_order_item(item)
    end
    details_list
  end
end

order = Order.new
item_list = order.get_input
order_details = order.get_order_details(item_list)
total_cost = order.get_total_cost(order_details)
total_sales_tax = order.get_total_sales_tax(order_details)
order_details.each do |item|
  item.print_item 
end
puts "Sales Taxes: #{sprintf("%.2f", total_sales_tax)}" 
puts "Total: #{sprintf("%.2f", total_cost)}"
