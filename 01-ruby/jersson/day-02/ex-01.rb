# Print the contents of an array of sixteen numbers, four numbers at a time, 
# using just each.
# Now, do the same with each_slice in Enumerable.

numbers = (0..15).to_a

puts 'Print four numbers at a time, using each'
numbers.each do |n|
    if n % 4 == 0
        puts "- Round #{1+ n / 4}: #{numbers[n..(n+3)]}" 
    end
end
puts

puts 'Print four numbers at a time, using each_slice in Enumerable'
i = 1
numbers.each_slice(4).each do |n|
    puts "- Round #{i}: #{n}"
    i += 1
end

# You can run this exercise using this command in the terminal
# ruby ex-01.rb