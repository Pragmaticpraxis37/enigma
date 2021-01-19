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
