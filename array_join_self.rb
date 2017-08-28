class Array
  #This method join target array with self
  def array_join(target)
    result = self
    target.each { |element| result << element }
    result
  end

end

class ArrayJoin < Array
  #This method prompt the user to input an array and returns that array
  def get_input
    input = []
    puts "Enter No. of characters in the array"
    size = gets.chomp.to_i
    puts "Enter array elements one by one"
    size.times { input << gets.chomp }
    input
  end
  #This method joins source array and target array
  def join (source, target)
    result = source.array_join(target)
  end
  #This method prints an array
  def print_result(result)
    puts "The resultant array after join is #{result}"
  end

end

merge = ArrayJoin.new
source = merge.get_input
target = merge.get_input
result = merge.join(source, target)
merge.print_result(result) #This line prints the result after join operation on the arrays
#The instruction " puts source.array_join(target) " also prints the result after join operation on the arrays
