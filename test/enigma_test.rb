require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new("Hello world", "040800", "10101")

    assert_instance_of Enigma, enigma
    assert_equal "Hello world", enigma.message
    assert_equal "10101", enigma.key
    assert_equal "040800", enigma.date
  end
end
