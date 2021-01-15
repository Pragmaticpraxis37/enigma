class Enigma

  attr_reader :message,
              :key,
              :date

  def initialize(message, *optional_key_and_date)
    @message = message
    @key = optional_key_and_date[0]
    require "pry"; binding.pry
    if optional_key_and_date[1].nil? == true
      @date = create_date
    else
      @date = Time.now.strftime("%d%m%y")
    end
  end
end
