require './test/test_helper'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/cipher'

class DecipherTest < Minitest::Test
  def test_it_exists
    decipher = Deipher.new("keder ohulw", "02715", "1025")
    assert_instance_of Decipher, decipher
  end

  def test_it_has_attributes
    decipher = Decipher.new("keder ohulw", "02715", "1025")

    assert_equal ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"], decipher.message
    assert_equal ["0", "2", "7", "1", "5"], decipher.key
    assert_equal ["1", "0", "2", "5"], decipher.offset
  end

end
