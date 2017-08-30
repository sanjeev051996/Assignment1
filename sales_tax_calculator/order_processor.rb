require_relative "tax_calculator"
require_relative "item"

class OrderProcessor < Item

  include TaxCalculator 
  #This method return object of item class containing the order information
  def build_order_item(description)
    detail_list = description.split(" ")
    quantity = detail_list[0].to_i
    price = detail_list[-1].to_f
    imported = is_imported?(detail_list)
    tax_rate = get_tax_rate(detail_list)
    tax = get_item_tax(price, tax_rate, imported)
    statement = description.split(" at")[0]
    item = Item.new({ quantity: quantity, price: price, tax: tax, statement: statement })
  end
end
