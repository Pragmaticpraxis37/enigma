require './test/test_helper'
require './lib/cipher'
require './lib/offset'
require './lib/key'
require './lib/enigma'

class CipherTest < Minitest::Test
  def test_it_exists
    cipher = Cipher.new

    assert_instance_of Cipher, cipher
  end
end 
