require 'date'
require './lib/key'
require './lib/offset'
require './lib/cipher'
require './lib/decipher'
require './lib/enigma'

encrypted_file = File.open(ARGV[0], 'r')
encrypted_message = encrypted_file.read.chomp

enigma = Enigma.new
decrypted = enigma.decrypt(encrypted_message, ARGV[2], ARGV[3])

decrypted_file = File.open(ARGV[1], 'w')
decrypted_file.write(decrypted[:decryption])
decrypted_file.close

p "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
