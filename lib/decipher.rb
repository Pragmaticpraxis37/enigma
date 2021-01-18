class Decipher
  attr_reader :ciphertext,
              :key,
              :offset,
              :shifts,
              :original_set,
              :shift_a_set,
              :shift_b_set,
              :shift_c_set,
              :shift_d_set

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
  end

  def create_sub_keys
    ord_letter = 97

    @key.each_cons(2).reduce({}) do |sub_keys, cons_nums|
      sub_keys[ord_letter.chr] = cons_nums.join.to_i
      ord_letter += 1
      sub_keys
    end
  end

  def create_sub_offsets
    ord_letter = 97

    @offset.reduce({}) do |sub_offsets, num|
      sub_offsets[ord_letter.chr] = num.to_i
      ord_letter += 1
      sub_offsets
    end
  end

  def create_shifts
    create_sub_keys.each do |key_letter, key_value|
      create_sub_offsets.each do |offset_letter, offset_value|
        if key_letter == offset_letter
          @shifts[key_letter] = key_value + offset_value
        end
      end
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

  def decrypt
    first = 1
    second = 2
    third = 3
    fourth = 4
    decoded = []
    @ciphertext.each_with_index do |letter, index|
      index += 1
      if index == first
        decoded << @shift_a_set.index(letter)
        first += 4
      elsif index == second
        decoded << @shift_b_set.index(letter)
        second += 4
      elsif index == third
        decoded << @shift_c_set.index(letter)
        third += 4
      elsif index == fourth
        decoded << @shift_d_set.index(letter)
        fourth += 4
      end
    end
    decoded
    require "pry"; binding.pry
  end

end
