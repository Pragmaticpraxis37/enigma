class Cipher
  attr_reader :message,
              :key,
              :offset

  def initialize(message, key, offset)
    @message = message
    @key = key.split("")
    @offset = offset.split("")
  end

  def method_name

  end

end
