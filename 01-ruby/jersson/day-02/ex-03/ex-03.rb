# Write a simple grep that will print the lines of a file having any occurrences 
# of a phrase anywhere in that line. You will need to do a simple regular expression 
# match and read lines from a file. (This is surprisingly simple in Ruby.) 
# If you want, include line numbers.

def simple_grep(filename, phrase)
    regexp = Regexp.new(phrase)
    File.open(filename, 'r') do |file|
        # file.each_line {|line| puts line if regexp =~line}
        file.each_line  do |line|
            puts "#{$.} - #{line}" if regexp =~line 
        end
    end
end

filename = 'problem.txt'
phrase = 'simple'

simple_grep(filename, phrase)

# You can run this exercise using this command in the terminal
# ruby ex-03.rb