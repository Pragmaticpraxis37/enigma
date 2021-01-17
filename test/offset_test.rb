require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new('010100')

    assert_instance_of Offset, offset
  end

  def test_create_key
    skip
    offset = Offset.new('none')

    assert_equal 6, offset.date.length
  end

  def test_determine_if_key_provided_returns_user_created_key
    key = Offset.new('010100')

    assert_equal '010100', key.key
  end
end
