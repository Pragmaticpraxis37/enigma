class Cipher
  attr_reader :message,
              :key,
              :offset

  def initialize(message, key, offset)
    @message = message
    @key = key.split("")
    @offset = offset.split("")
    @shifts = {}
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

  end

end
