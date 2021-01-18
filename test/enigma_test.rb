require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt_method_creates_key_object
    enigma = Enigma.new

    enigma.encrypt('Hello world', "10101", 4444)
    require "pry"; binding.pry
  end


  def test_determine_if_key_provided_returns_try_again_message
    skip
    key = Key.new(10101)

    assert_equal 'All user created keys must be a five-digit string.  Please try again.', key.key
  end
  #
  # def test_date_argument_has_default_value
  #   enigma = Enigma.new("Hello world", "10101")
  #
  #   assert_equal "Hello world", enigma.message
  #   assert_equal "10101", enigma.key
  #   assert_equal Time.now.strftime("%d%m%y"), enigma.date
  # end
  #
  # def test_key_is_assigned_when_optional_argument_for_it_is_provided
  #   enigma = Enigma.new("Hello world", "10101")
  #
  #   assert_equal "10101", enigma.key
  # end
  #
  # def test_key_argument_has_default_value
  #   enigma = Enigma.new("Hello world", "040800")
  #   assert_equal 5, enigma.key.length
  # end
  #
  # def test_key_is_generated_if_no_optional_arguments
  #   enigma = Enigma.new("Hello")
  #   assert_equal 5, enigma.key.length
  # end
  #
  # def test_date_is_generated_if_no_optional_arguments
  #   enigma = Enigma.new("Hello")
  #   assert_equal Time.now.strftime("%d%m%y"), enigma.date
  # end
  #
  # def test_date_and_key_arguments_have_default_values
  #   enigma = Enigma.new("Hello world")
  #   assert_equal "Hello world", enigma.message
  #   assert_equal 5, enigma.key.length
  #   assert_equal Time.now.strftime("%d%m%y"), enigma.date
  # end
end
