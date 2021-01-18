class Offset

  attr_reader :date,
              :squared,
              :squared_last_four

  def initialize(date)
    @squared = 0
    @squared_last_four = ''
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
  end
end
