require './test/test_helper'

class CipherTest < Minitest::Test
  def test_it_exists
    cipher = Cipher.new("Hello world", "02715", "1025")
    assert_instance_of Cipher, cipher
  end

  def test_it_has_attributes
    cipher = Cipher.new("Hello world", "02715", "1025")

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                " "]

    assert_equal ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"], cipher.message
    assert_equal ["0", "2", "7", "1", "5"], cipher.key
    assert_equal ["1", "0", "2", "5"], cipher.offset
    assert_equal expected, cipher.original_set
  end

  def test_create_sub_keys
    cipher = Cipher.new("Hello world", "02715", "1025")

    expected = {"a"=>2, "b"=>27, "c"=>71, "d"=>15}

    assert_equal expected, cipher.create_sub_keys
  end

  def test_create_sub_offsets
    cipher = Cipher.new("Hello world", "02715", "1025")

    expected = {"a"=>1, "b"=>0, "c"=>2, "d"=>5}

    assert_equal expected, cipher.create_sub_offsets
  end

  def test_create_shifts
    cipher = Cipher.new("Hello world", "02715", "1025")

    expected = {"a"=>3, "b"=>27, "c"=>73, "d"=>20}

    assert_equal expected, cipher.shifts
  end

  def test_create_unciphered_index_collection
    cipher = Cipher.new("Hello world", "02715", "1025")

    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    assert_equal expected, cipher.unciphered_index_collection
  end

  def test_create_shift_sets
    cipher = Cipher.new("Hello world", "02715", "1025")

    expected_1 = ["d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
                  "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ",
                  "a", "b", "c"]
    expected_2 = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                  "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                  "y", "z", " "]
    expected_3 = ["t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d",
                  "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
                  "q", "r", "s"]
    expected_4 = ["u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d", "e",
                  "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q",
                  "r", "s", "t"]

    assert_equal expected_1, cipher.shift_a_set
    assert_equal expected_2, cipher.shift_b_set
    assert_equal expected_3, cipher.shift_c_set
    assert_equal expected_4, cipher.shift_d_set
  end

  def test_encrypt_hello_world
    cipher = Cipher.new("Hello world", "02715", "1025")

    assert_equal "keder ohulw", cipher.encrypt
  end

  def test_encrypt_here_it_is
    cipher = Cipher.new("Here it is", "52631", "8884")

    assert_equal "nlhmfpjhoz", cipher.encrypt
  end
end
