module TaxCalculator
  #This method returns amount of sales tax
  def get_item_tax(price, tax_rate, is_imported)
    tax = is_imported ? (tax_rate + 0.05) * price : tax_rate * price
    round_off(tax)
  end
  #This method round off the number to the next 0.05
  def round_off(amount)
    (amount * 20).ceil / 20.0
  end
end
