require 'minitest/autorun'

def caesar_cipher(text, nbr)
  raise TypeError, 'Not a string' unless text.is_a?(String)
  raise TypeError, 'Not a number' unless nbr.is_a?(Integer)

  result = text.each_char.map do |c|
    if c.between?('A', 'Z')
      ((c.ord - 'A'.ord + nbr) % 26 + 'A'.ord).chr
    elsif c.between?('a', 'z')
      ((c.ord - 'a'.ord + nbr) % 26 + 'a'.ord).chr
    else
      c
    end
  end.join

  result
end

class TestCaesar < Minitest::Test
  def test_valid_inputs
    assert_equal('Bcde', caesar_cipher('Abcd', 1))
    assert_equal('Bcde', caesar_cipher('Abcd', 27))
    assert_equal('hello world!', caesar_cipher('hello world!', 0))
    assert_equal('ifmmp xpsme!', caesar_cipher('hello world!', 1))
    assert_equal('b@!#$%&*()~\'\\"A', caesar_cipher('a@!#$%&*()~\'\\"Z', 1))
  end

  def test_invalid_inputs
    assert_raises(TypeError) { caesar_cipher(1, 1) }
    assert_raises(TypeError) { caesar_cipher('hello', 'world') }
  end
end
