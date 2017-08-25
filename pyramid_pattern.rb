pyramid_height = gets.chomp.to_i
pyramid_width = pyramid_height * 2 - 1
pyramid_height.times do |current_height| 
  blank_space = (pyramid_width - current_height * 2 + 3) / 2
  blank_space.times { print " " }
  (current_height * 2 + 1).times { print "*" }
  blank_space.times { print " " }
  puts ""
end
