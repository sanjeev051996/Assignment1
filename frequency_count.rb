class CharacterFrequency
  #This method prompts the user to input an array
  def get_input
    user_input = []
    puts "Enter No. of characters in the character array"
    size = gets.chomp.to_i
    puts "Enter array elements one by one"
    size.times { user_input << gets.chomp }
    user_input
  end
  #This method prints a hash map
  def print_result(result)
    result.each { |element, frequency| puts "frequency of #{element} is #{frequency}" }
  end 
  #This method returns a frequency hash of an array
  def get_frequency_hash(source)
    collection = {}
    source.each { |element| collection[element] = (collection[element] || 0) + 1 }
    collection
  end

end

frequency = CharacterFrequency.new
user_input = frequency.get_input #This line prompts the user to input the character array
result = frequency.get_frequency_hash(user_input) 
frequency.print_result(result) #This line prints a hash containing frequency of each input array element
