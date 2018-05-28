

def caesar str="", n=1
  ''' takes a string and a number, shifts each chars
  with the number. puts the result.
  '''
  if str.length == 0
    puts "enter a phrase to cipher..."
    str = gets.chomp
  end

  c_str =""

  str.each_char do |c|
    if c =~ /[A-za-z]/
      n.times { c = c.next![0] }
      c_str += c
    else
      c_str += c
    end
  end
  puts c_str
end

caesar "Test also 123, special chars ?!", 100