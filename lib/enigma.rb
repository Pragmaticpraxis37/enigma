class Enigma

  attr_reader :message,
              :key,
              :date

  def initialize(message, date = Time.now, *key)
    @message = message
    @key = key[0]
    require "pry"; binding.pry
    @date = date
  end

end
