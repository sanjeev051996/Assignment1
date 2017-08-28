class ArrayDouble

  def get_input
    input = []
    puts "Enter No. of integers in the array"
    size = gets.chomp.to_i
    puts "Enter array elements one by one"
    size.times { input << gets.chomp.to_i }
    input
  end

  def get_double(source)
    double_block = lambda { |element|  2 * element }
    source.map(&double_block)
  end

  def print_result(result)
    puts "the resultant array is #{result}"
  end

end

double_elements = ArrayDouble.new
user_input = double_elements.get_input
result = double_elements.get_double(user_input)
double_elements.print_result(result)
