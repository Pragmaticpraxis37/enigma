class Offset

  def initialize(date)
    @date = determine_if_date_provided(date)
    @offset_shift_a = ""
    @offset_shift_b = ""
    @offset_shift_c = ""
    @offset_shift_d = ""
  end

  def determine_if_date_provided(date)
    if date == 'none'
      create_date
    elsif (date.class == String) && date.length == 6
      return date
    end
  end


end
