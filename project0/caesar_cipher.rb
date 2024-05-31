def caesar_cipher(str, nbr)
  result = str.each_char.map do |c|
    if c.between?('A', 'Z')
      ((c.ord - 'A'.ord + nbr) % 26 + 'A'.ord).chr
    elsif c.between?('a', 'z')
      ((c.ord - 'a'.ord + nbr) % 26 + 'a'.ord).chr
    else
      c
    end
  end.join

  puts result
end

# add unit tests later
caesar_cipher('What a string!', 5)
