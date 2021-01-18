require 'date'
require './lib/key'
require './lib/offset'
require './lib/cipher'

class Enigma

  def initialize
  end

  def encrypt(message, key='none', offset='none')
    key = Key.new(key)
    offset = Offset.new(offset)
    cipher = Cipher.new(message, key.key, offset.squared_last_four)
  end

  def decrypt(ciphertext, key, offset='none')
    key = Key.new(key)
    offset = Offset.new(offset)
    deciper = Decipher.new(ciphertext, key, offset)
  en
end

  # attr_reader :message,
  #             :key,
  #             :date

  # def initialize(message, date = "none", key = "none" *optional_key_and_date)
  #   @message = message
  #   @key = determine_key(optional_key_and_date)
  #   @date = determine_date(optional_key_and_date)
  #
  #   user_date = date
  #
  #   if date == "none"
  #     create date
  #   else
  #     date
  #
  # end


  # def determine_key(optional_key_and_date)
  #   if optional_key_and_date.empty?
  #     return create_key
  #   elsif optional_key_and_date.length == 1 && optional_key_and_date[0].length != 5
  #     return create_key
  #   else
  #     return optional_key_and_date[0]
  #   end
  # end
  #
  # def create_key
  #   key = rand(99999)
  #   key_as_string = key.to_s
  #   if key_as_string.length == 5
  #     key_as_string
  #   else
  #     trailing_zeros = 5 - key_as_string
  #     key_as_string.prepend("0" * trailing_zeros)
  #   end
  # end
  #
  # def determine_date(optional_key_and_date)
  #   if optional_key_and_date.empty?
  #     return create_date
  #   elsif optional_key_and_date.length == 1 && optional_key_and_date[0].length != 6
  #     return create_date
  #   else
  #     return optional_key_and_date[1]
  #   end
  # end
  #
  # def create_date
  #   @date = Time.now.strftime("%d%m%y")
  # end
