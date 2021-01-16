require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    key = Key.new('00001')

    assert_instance_of Key, key
  end

  def test_determine_if_key_provided_returns_user_created_key
    key = Key.new('00001')

    assert_equal '00001', key.key
  end

  def test_determine_if_key_provided_returns_try_again_message
    key = Key.new(10101)

    assert_equal 'All user created keys must be a five digit string.  Please try again.', key.key
  end

  def test_create_key
    key = Key.new('none')

    assert_equal 5, key.key.length 
  end
end
