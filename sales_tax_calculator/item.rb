class Item

  attr_accessor :quantity, :price, :tax, :statement 

  EXEMPTED_LIST = ["book", "books", "pills", "chocolate", "chocolates"]
  TAX_RATE = 0.10

  def initialize(params = {})
    params.each { |attribute,value| send "#{attribute}=", value }
  end


  def is_imported?(detail_list)
    detail_list.include? "imported"
  end

  def is_taxable?(detail_list)
    (EXEMPTED_LIST & detail_list).empty?
  end

  def get_tax_rate(detail_list)
    is_taxable?(detail_list) ? TAX_RATE : 0
  end

  def print_item
    net_price = @price + @tax
    puts "#{@statement}: #{sprintf("%.2f", net_price)}"
  end
end
