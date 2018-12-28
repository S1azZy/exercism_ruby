class Squares
  attr_reader :number_series

  def initialize(number)
    @number_series = (1..number)
  end

  def square_of_sum
    @square_of_sum ||= number_series.reduce(:+).pow(2)
  end

  def sum_of_squares
    @sum_of_squares ||= number_series.reduce { |sum, n| sum + n.pow(2) }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end