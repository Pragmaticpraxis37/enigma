require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new('010100')

    assert_instance_of Offset, offset
  end
end
