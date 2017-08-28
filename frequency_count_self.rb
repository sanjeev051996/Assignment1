class Array
  #This method return a hash map containing frequency of each character in the array
  def get_frequency_hash
    frequency = {}
    self.each { |array_element| frequency[array_element] = (frequency[array_element] || 0) + 1 }
    frequency
  end

end

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
  def print_result(collection)
    collection.each { |element , frequency| puts "frequency of #{element} is #{frequency}" }
  end 

end

frequency = CharacterFrequency.new
user_input = frequency.get_input #This line prompts the user to input the character array
result = user_input.get_frequency_hash 
frequency.print_result(result) #This line prints a hash containing frequency of each input array element
