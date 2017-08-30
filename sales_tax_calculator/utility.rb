module Utility
  
  def get_total_cost(order_details)
    order_details.inject(0) { |cost, item| cost + (item.price + item.tax) * item.quantity }
  end

  def get_total_sales_tax(order_details)
    order_details.inject(0) { |tax, item| tax + item.tax }
  end
end
