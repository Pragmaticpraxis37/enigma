require './lib/shiftable'

class Cipher
  include Shiftable

  attr_reader :message,
              :key,
              :offset,
              :shifts,
              :original_set,
              :sub_keys,
              :unciphered_index_collection,
              :shift_a_set,
              :shift_b_set,
              :shift_c_set,
              :shift_d_set

  def initialize(message, key, offset)
    @message = message.downcase.split("")
    @key = key.split("")
    @offset = offset.split("")
    @shifts = {}
    @original_set = (("a".."z").to_a << " ")
    @unciphered_index_collection = create_unciphered_index_collection
    @shift_a_set = []
    @shift_b_set = []
    @shift_c_set = []
    @shift_d_set = []
    create_shifts
    create_shift_sets
  end

  def create_unciphered_index_collection
    @message.reduce([]) do |acc, letter|
      acc << original_set.index(letter)
    end
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

  def encrypt
    first, second, third, fourth = 1, 2, 3, 4
    @unciphered_index_collection.each_with_index.reduce([]) do |acc, (letter, index)|
      index += 1
      if index == first
        acc << @shift_a_set[letter]
        first += 4
      elsif index == second
        acc << @shift_b_set[letter]
        second += 4
      elsif index == third
        acc << @shift_c_set[letter]
        third += 4
      elsif index == fourth
        acc << @shift_d_set[letter]
        fourth += 4
      end
      acc
    end.join
  end
end
