require './test/test_helper'

class DecipherTest < Minitest::Test
  def test_it_exists
    decipher = Decipher.new("keder ohulw", "02715", "1025")
    assert_instance_of Decipher, decipher
  end

  def test_it_has_attributes
    decipher = Decipher.new("keder ohulw", "02715", "1025")

    assert_equal ["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"], decipher.ciphertext
    assert_equal ["0", "2", "7", "1", "5"], decipher.key
    assert_equal ["1", "0", "2", "5"], decipher.offset
  end

  def test_create_sub_keys
    decipher = Decipher.new("keder ohulw", "02715", "1025")

    expected = {"a"=>2, "b"=>27, "c"=>71, "d"=>15}

    assert_equal expected, decipher.create_sub_keys
  end

  def test_create_sub_offsets
    decipher = Decipher.new("keder ohulw", "02715", "1025")

    expected = {"a"=>1, "b"=>0, "c"=>2, "d"=>5}

    assert_equal expected, decipher.create_sub_offsets
  end

  def test_create_shifts
    decipher = Decipher.new("keder ohulw", "02715", "1025")
    decipher.create_shifts

    expected = {"a"=>3, "b"=>27, "c"=>73, "d"=>20}

    assert_equal expected, decipher.shifts
  end


  def test_create_shift_sets
    decipher = Decipher.new("keder ohulw", "02715", "1025")
    decipher.create_shifts
    decipher.create_shift_sets

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

    assert_equal expected_1, decipher.shift_a_set
    assert_equal expected_2, decipher.shift_b_set
    assert_equal expected_3, decipher.shift_c_set
    assert_equal expected_4, decipher.shift_d_set
  end


  def test_create_ciphered_index_collection
    decipher = Decipher.new("keder ohulw", "02715", "1025")
    decipher.create_shifts
    decipher.create_shift_sets
    decipher.create_ciphered_index_collection

    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    assert_equal expected, decipher.ciphered_index_collection
  end

  def test_decrypt_keder_ohulw
    decipher = Decipher.new("keder ohulw", "02715", "1025")
    decipher.create_shifts
    decipher.create_shift_sets
    decipher.create_ciphered_index_collection


    assert_equal "hello world", decipher.decrypt
  end

  def test_decrypt_keder_ohulw
    decipher = Decipher.new("nlhmfpjhoz", "52631", "8884")
    decipher.create_shifts
    decipher.create_shift_sets
    decipher.create_ciphered_index_collection


    assert_equal "here it is", decipher.decrypt
  end
end
