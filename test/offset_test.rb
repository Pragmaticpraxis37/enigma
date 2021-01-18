require './test/test_helper'

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

  def test_square_date_when_user_created_date
    offset = Offset.new('010200')

    assert_equal 104040000, offset.squared
  end

  def test_square_date_when_create_date_provides_date
    offset = Offset.new('none')

    assert_equal 11, offset.squared.to_s.length
  end

  def test_remove_last_four_of_date_squared_when_user_created_date
    offset = Offset.new('010200')

    assert_equal '0000', offset.squared_last_four
  end

  def test_case_name_remove_last_four_of_date_squared_when_create_date_provides_date
    offset = Offset.new('none')

    assert_equal 4, offset.squared_last_four.length
  end

  def test_split_offset_by_shift_when_user_created_date
    offset = Offset.new('010210')

    assert_equal '4', offset.offset_shift_a
    assert_equal '1', offset.offset_shift_b
    assert_equal '0', offset.offset_shift_c
    assert_equal '0', offset.offset_shift_d
  end

  def test_split_offset_by_shift_when_create_date_provides_date
    offset = Offset.new('none')

    assert_equal 1, offset.offset_shift_a.length
    assert_equal 1, offset.offset_shift_b.length
    assert_equal 1, offset.offset_shift_c.length
    assert_equal 1, offset.offset_shift_d.length
  end
end
