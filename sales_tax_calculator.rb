class SalesTaxCalculator
  
  EXEMPTED_LIST = ["book", "books", "pills", "chocolate", "chocolates"]
  TAX_RATE = 0.10
  #This method returns amount of sales tax
  def get_item_tax(price, tax_rate, is_imported)
    tax = is_imported ? (tax_rate + 0.05) * price : tax_rate * price
    round_off(tax)
  end
  #This method returns final net price after tax
  def net_item_price(tax, price)
    price + tax
  end 
  #This line prints the final output
  def print_item(item)
    puts "#{item[:statement]}: #{sprintf("%.2f", item[:net_price])}"
  end 
  #This method round off the number to the next 0.05
  def round_off(amount)
    (amount / 0.05).ceil * 0.05
  end

  def get_total_cost(order_details)
    order_details.inject(0) { |cost, item| cost + (item[:net_price] * item[:quantity]) }
  end

  def get_total_sales_tax(order_details)
    order_details.inject(0) { |tax, item| tax + item[:tax] }
  end 

  def sales_tax_rate(detail_list)
    (EXEMPTED_LIST & detail_list).empty? ? TAX_RATE : 0
  end

end 

class GetOrder < SalesTaxCalculator
  #This method prompts the user to input the information about the transactions
  def get_input
    item_list = []
    puts "Enter no. of transactions"
    size = gets.chomp.to_i
    puts "Enter the information about transactions one by one"
    size.times { item_list << gets.chomp }
    item_list
  end
  #This method return a hash containing the order information
  def build_order_item(description)
    detail_list = description.split(" ")
    size = detail_list.length - 1
    { quantity: detail_list[0].to_i, price: detail_list[size].to_f, sales_tax_rate: sales_tax_rate(detail_list),
      is_imported: (detail_list.include? "imported")
    }
  end
  #This method updates total cost of the transaction
  def process_order_item(description)
    item = build_order_item(description)
    tax = get_item_tax(item[:price], item[:sales_tax_rate], item[:is_imported])
    price = net_item_price(tax, item[:price])
    { quantity: item[:quantity], tax: tax, net_price: price, statement: description.split(" at")[0] }
  end

  def get_order_details(item_list)
    details_list = []
    item_list.each do |item|
      item_details = process_order_item(item)
      details_list << item_details
    end
    details_list
  end

end 

order = GetOrder.new
item_list = order.get_input
order_details = order.get_order_details(item_list)
total_cost = order.get_total_cost(order_details)
total_sales_tax = order.get_total_sales_tax(order_details)
order_details.each do |item|
  order.print_item(item) 
end
puts "Sales Taxes: #{sprintf("%.2f", total_sales_tax)}" 
puts "Total: #{sprintf("%.2f", total_cost)}"
