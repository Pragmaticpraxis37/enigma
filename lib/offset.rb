class Offset

  attr_reader :date,
              :squared,
              :squared_last_four,
              :offset_shift_a,
              :offset_shift_b,
              :offset_shift_c,
              :offset_shift_d

  def initialize(date)
    @squared = 0
    @squared_last_four = ''
    @offset_shift_a = ''
    @offset_shift_b = ''
    @offset_shift_c = ''
    @offset_shift_d = ''
    @date = date
    determine_if_date_provided(date)
  end

  def determine_if_date_provided(date)
    if date == 'none'
      create_date
    elsif (date.class == String) && date.length == 6
      @date = date
      square_date(date)
    end
  end

  def create_date
    @date = Time.now.strftime('%d%m%y')
    square_date(date)
  end

  def square_date(date)
    @squared = date.to_i ** 2
    remove_last_four_of_date_squared
  end

  def remove_last_four_of_date_squared
    @squared_last_four = @squared.to_s[-4..-1]
    split_offset_by_shift
  end

  def split_offset_by_shift
    @offset_shift_a = @squared_last_four[0]
    @offset_shift_b = @squared_last_four[1]
    @offset_shift_c = @squared_last_four[2]
    @offset_shift_d = @squared_last_four[3]
  end

end
