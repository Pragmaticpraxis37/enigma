class Key
  attr_reader :key


  def initialize(key)
    @key = determine_if_key_provided(key)
  end

  def determine_if_key_provided(key)
    if key == 'none'
      create_key
    elsif (key.class == String) && key.length == 5
      return key
    else
      "All user created keys must be a five digit string.  Please try again."
    end
  end

  def create_key
    key = rand(1..99999)
    key = "%05d" %(x)
    return key
  end
end
