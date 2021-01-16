require './test/test_helper'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new("Hello world", "10101", "040800")

    assert_instance_of Enigma, enigma
    assert_equal "Hello world", enigma.message
    assert_equal "10101", enigma.key
    assert_equal "040800", enigma.date
  end

  def test_date_argument_has_default_value
    enigma = Enigma.new("Hello world", "10101")

    assert_equal "Hello world", enigma.message
    assert_equal "10101", enigma.key
    assert_equal Time.now.strftime("%d%m%y"), enigma.date
  end

  def test_key_argument_has_default_value
    enigma = Enigma.new("Hello world", "040800")

    assert_instance_of Enigma, enigma
    assert_equal "Hello world", enigma.message
    assert_equal 5, enigma.key.length 
    assert_equal "040800", enigma.date
  end
end
