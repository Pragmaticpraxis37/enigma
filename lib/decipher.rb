require './lib/shiftable'

class Decipher
  include Shiftable

  attr_reader :ciphertext,
              :key,
              :offset,
              :shifts,
              :original_set,
              :shift_a_set,
              :shift_b_set,
              :shift_c_set,
              :shift_d_set,
              :ciphered_index_collection

  def initialize(ciphertext, key, offset)
    @ciphertext = ciphertext.downcase.split("")
    @key = key.split("")
    @offset = offset.split("")
    @shifts = {}
    @original_set = (("a".."z").to_a << " ")
    @shift_a_set = []
    @shift_b_set = []
    @shift_c_set = []
    @shift_d_set = []
    @ciphered_index_collection = []
    create_shifts
    create_shift_sets
    create_ciphered_index_collection
  end

  def create_shift_sets
    @shifts.each do |letter, value|
      if letter == "a"
        @shift_a_set = @original_set.rotate(value)
      elsif letter == "b"
        @shift_b_set = @original_set.rotate(value)
      elsif letter == "c"
        @shift_c_set = @original_set.rotate(value)
      else
        @shift_d_set = @original_set.rotate(value)
      end
    end
  end

  def create_ciphered_index_collection
    first, second, third, fourth = 1, 2, 3, 4
    @ciphertext.each_with_index do |letter, index|
      index += 1
      if index == first
        @ciphered_index_collection << @shift_a_set.index(letter)
        first += 4
      elsif index == second
        @ciphered_index_collection << @shift_b_set.index(letter)
        second += 4
      elsif index == third
        @ciphered_index_collection << @shift_c_set.index(letter)
        third += 4
      elsif index == fourth
        @ciphered_index_collection << @shift_d_set.index(letter)
        fourth += 4
      end
    end
  end

  def decrypt
    @ciphered_index_collection.map do |index|
      @original_set[index]
    end.join
  end
end
