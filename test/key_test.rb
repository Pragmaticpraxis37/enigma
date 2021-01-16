require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'

class KeyTest < Minitest::Test
  def test_it_exists_and_has_attributes
    key = Key.new("00001")

    assert_instance_of Key, key
  end

  def test_determine_if_key_returns_key_provided
    key = Key.new("00001")

    assert_equal "00001", key.key 
  end
end
