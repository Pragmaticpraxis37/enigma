require './test/test_helper'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/cipher'

class CipherTest < Minitest::Test
  def test_it_exists
    cipher = Cipher.new("Hello world", "02715", "040895")
    assert_instance_of Cipher, cipher
  end

  def test_it_has_attributes
    cipher = Cipher.new("Hello world", "02715", "1025")

    assert_equal "Hello world", cipher.message
    assert_equal ["0", "2", "7", "1", "5"], cipher.key
    assert_equal ["1", "0", "2", "5"], cipher.offset
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
end


# key = "02715"
#
# key_split = key.split("")
#
# ord_letter = 97
#
# keys = key_split.each_cons(2).reduce({}) do |keys_hash, two_nums|
#   keys_hash[ord_letter.chr] = two_nums.join.to_i
#   ord_letter += 1
#   keys_hash
# end
#
# ord_letter = 97
#
# offset = "1025"
#
# offset_split = offset.split("")
#
# offsets = offset_split.reduce({}) do |offset_hash, num|
#   offset_hash[ord_letter.chr] = num.to_i
#   ord_letter += 1
#   offset_hash
# end
#
# s = {}
#
# x = keys.each do |key_letter, key_value|
#   offsets.each do |offset_letter, offset_value|
#     if key_letter == offset_letter
#       s[key_letter] = key_value + offset_value
#     end
#   end
# end
#
#
# # 1. Determine regular_index in regular_letters array
# # 2. Create changed_array with shift number
# # 3. Determine new letter by changed_array[regular_index]
#
# original_set = (("a".."z").to_a << " ")
# index_key = original_set.index("h")
# rotated_set = original_set.rotate(3)
# rotated_set[index_key]
#
# # 1. Translate phrase into index numbers array. This is regular_index array
# # 2. Create four changed arrays for shift a, shift b, shift c, and shift d.
# # 3. Create empty array, ciphered text
# # 4. Use index to determine shift to grab new letter from
# # 5. Shovel new letter into ciphered text array.
#
# text = "hello"
# text = text.split("")
#
#
# index_array = text.reduce([]) do |acc, letter|
#   acc << original_set.index(letter)
# end
#
# hash = {"a"=>3, "b"=>27, "c"=>73, "d"=>20}
#
# def rotate_array(key)
#   rotate = hash[key]
# end
