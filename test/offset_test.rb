require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new('010100')

    assert_instance_of Offset, offset
  end

  def test_create_date
    offset = Offset.new('none')

    assert_equal 6, offset.date.length
  end

  def test_determine_if_date_provided_returns_user_created_date
    offset = Offset.new('010100')

    assert_equal '010100', offset.date
  end

  def test_square_date
    offset = Offset.new('010200')

    assert_equal 104040000, offset.squared
  end

  def test_remove_last_four_of_date_squared
    offset = Offset.new("010200")

    assert_equal "0000", offset.squared_last_four
  end
end
