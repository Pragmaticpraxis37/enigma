require 'date'

class Enigma

  def initialize
  end

  def encrypt(message, key='none', offset='none')
    key = Key.new(key)
    offset = Offset.new(offset)
    cipher = Cipher.new(message, key.key, offset.squared_last_four)
    encrypted = cipher.encrypt
    encrypted_results = {encryption: encrypted, key: key.key, date: offset.date}
  end

  def decrypt(ciphertext, key, offset='none')
    offset = Offset.new(offset)
    decipher = Decipher.new(ciphertext, key, offset.squared_last_four)
    decrypted = decipher.decrypt
    decrypted_results = {decryption: decrypted, key: key, date: offset.date}
  end
end
