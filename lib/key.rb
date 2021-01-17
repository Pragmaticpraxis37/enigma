class Key
  attr_reader :key,
              :key_shift_a,
              :key_shift_b,
              :key_shift_c,
              :key_shift_d

  def initialize(key)
    @key = determine_if_key_provided(key)
    @key_shift_a = ""
    @key_shift_b = ""
    @key_shift_c = ""
    @key_shift_d = ""
    split_key_by_shift(key)
  end

  def determine_if_key_provided(key)
    if key == 'none'
      create_key
    elsif (key.class == String) && key.length == 5
      return key
    end 
  end

  def create_key
    key = rand(1..99999)
    key = "%05d" %(key)
    return key
  end

  def split_key_by_shift(key)
    @key_shift_a = key[0..1]
    @key_shift_b = key[1..2]
    @key_shift_c = key[2..3]
    @key_shift_d = key[3..4]
  end
end
