require 'date'
require './lib/key'
require './lib/offset'
require './lib/cipher'
require './lib/decipher'
require './lib/enigma'

message_file = File.open(ARGV[0], 'r')
message = message_file.read.chomp

enigma = Enigma.new
encrypted = enigma.encrypt(message)

encrypted_file = File.open(ARGV[1], 'w')
encrypted_file.write(encrypted[:encryption])
encrypted_file.close

p "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
