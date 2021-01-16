class Enigma

  attr_reader :message,
              :key,
              :date

  def initialize(message, *optional_key_and_date)
    @message = message
    @key = determine_key(optional_key_and_date)
    # @date = determine_date(optional_key_and_date)
  end

  def determine_key(optional_key_and_date)
    if optional_key_and_date.empty?
      return create_key
      require "pry"; binding.pry
    # elsif optional_key_and_date.length == 1
    #   determine_if_optional_argument_has_key
    else
      find_key
      require "pry"; binding.pry
    end
  end

  def create_key
    key = rand(99999)
    require "pry"; binding.pry
    key_as_string = key.to_s
    require "pry"; binding.pry
    if key_as_string.length == 5
      require "pry"; binding.pry
      key_as_string
    else
      trailing_zeros = 5 - key_as_string
      require "pry"; binding.pry
      key_as_string.prepend("0" * trailing_zeros)
    end
  end

  def determine_if_optional_argument_has_key

  end

  def find_key

  end



  def determine_date(optional_key_and_date)
    require "pry"; binding.pry
  end


end


# @key = optional_key_and_date[0]
# require "pry"; binding.pry
# if optional_key_and_date[1].nil? == true
#   require "pry"; binding.pry
#   @date = true
# else
#   @date = Time.now.strftime("%d%m%y")
# end
