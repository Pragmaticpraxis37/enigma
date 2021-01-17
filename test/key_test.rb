require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    key = Key.new('00001')

    assert_instance_of Key, key
  end

  def test_create_key
    key = Key.new('none')

    assert_equal 5, key.key.length
  end

  def test_determine_if_key_provided_returns_user_created_key
    key = Key.new('00001')

    assert_equal '00001', key.key
  end

  def test_split_key_by_shift_returns_split_key_shifts_with_user_created_key
    key = Key.new('12345')

    assert_equal '12', key.key_shift_a
    assert_equal '23', key.key_shift_b
    assert_equal '34', key.key_shift_c
    assert_equal '45', key.key_shift_d
  end
end
