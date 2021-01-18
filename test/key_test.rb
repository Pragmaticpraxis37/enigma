require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists
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
end
