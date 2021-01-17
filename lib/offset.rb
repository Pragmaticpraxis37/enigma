class Offset

  attr_reader :date,
              :squared

  def initialize(date)
    @squared = 0
    @offset_shift_a = ""
    @offset_shift_b = ""
    @offset_shift_c = ""
    @offset_shift_d = ""
    @date = determine_if_date_provided(date)
  end

  def determine_if_date_provided(date)
    if date == 'none'
      create_date
    elsif (date.class == String) && date.length == 6
      return date
    end
  end

  def create_date
    @date = Time.now.strftime("%d%m%y")
  end

  def square_date(date)
    require "pry"; binding.pry
    @squared = date.to_i ** 2
    remove_last_four_of_squared_date(squared)
  end

  def remove_last_four_of_squared_date(squared)
    @squared = squared[-4..-1]
    require "pry"; binding.pry
  end

end
