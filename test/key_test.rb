require './test/test_helper'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new('00001')

    assert_instance_of Key, key
  end

  def test_create_key
    key = Key.new('none')

    assert_equal 5, key.key.length
    assert_equal String, key.key.class
  end

  def test_determine_if_key_provided_returns_user_created_key
    key = Key.new('00001')

    assert_equal '00001', key.key
  end
end
