require './test/test_helper' 
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_it_exists_and_has_attributes
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end
end
