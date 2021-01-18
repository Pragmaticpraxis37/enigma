require './test/test_helper'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/cipher'

class DecipherTest < Minitest::Test
  def test_it_exists
    decipher = Deipher.new("Hello world", "02715", "040895")
    assert_instance_of Decipher, decipher
  end
