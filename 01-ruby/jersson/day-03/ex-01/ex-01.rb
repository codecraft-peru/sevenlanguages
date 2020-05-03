# Modify the CSV application to support an each method to return a CsvRow object. 
# Use method_missing on that CsvRow to return the value for the column for a given heading.
# For example, for the file: 
# one, two​ 	
# lions, tigers

# allow an API that works like this:
# csv = RubyCsv.new
# ​csv.each {|row| puts row.one}
# This should print "lions".

class Row
  def initialize(header, row)
    @header = header
    @row = row
  end

  def method_missing name, *args
    index = @header.index(name.to_s)
    return @row[index]
  end
end

class ActsAsCsv
  def read
    file = File.new(self.class.to_s.downcase + ".txt")
    @header = file.gets.chomp.split(", ")

    file.each do |row|
      @content << Row.new(@header, row.chomp.split(", "))
    end
  end

  def header
    @header
  end

  def csv_contents
    @content
  end

  def initialize
    @content = []
    read
  end
end

class RubyCsv < ActsAsCsv
  def each(&data)
    @content.each(&data)
  end
end


csv = RubyCsv.new
csv.each { |row| puts row.one }

# You can run this exercise using this command in the terminal
# ruby ex-01.rb