class ArrayDouble
  #This line prompts the user to input an array
  def get_input
    input = []
    puts "Enter No. of elements in the array"
    size = gets.chomp.to_i
    puts "Enter array elements one by one"
    size.times { input << gets.chomp }
    input
  end

  def get_double(source)
    double_block = lambda do |element|  
      if /[a-zA-Z]/.match(element) 
        "Character" 
      elsif /[.]/.match(element)  
        (2 * element.to_f).to_s 
      else 
        (2 * element.to_i).to_s
      end
    end
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
