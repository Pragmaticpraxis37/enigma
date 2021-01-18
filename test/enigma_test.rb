require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt_message_with_message_key_and_date
    enigma = Enigma.new

    expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

    assert_equal expected, enigma.encrypt("Hello world", "02715", "040895")
  end

  def test_decrypt_message_with_message_key_and_date
    enigma = Enigma.new

    expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_encrypt_message_with_message_and_key
    enigma = Enigma.new

    assert_equal 3, enigma.encrypt("Hello world", "02715").length
    assert_equal Hash, enigma.encrypt("Hello world","02715").class
    assert_equal "02715", enigma.encrypt("Hello world","02715")[:key]
  end

  def test_decrypt_with_message_and_key
    enigma = Enigma.new

    assert_equal 3, enigma.decrypt("Hello world", "02715").length
    assert_equal Hash, enigma.decrypt("Hello world","02715").class

  end

  def test_encrypt_message_with_only_message
    enigma = Enigma.new

    assert_equal 3, enigma.encrypt("Hello world").length
    assert_equal Hash, enigma.encrypt("Hello world").class
  end
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
