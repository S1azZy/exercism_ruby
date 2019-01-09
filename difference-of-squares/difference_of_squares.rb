class Squares
  def initialize(number)
    @number_series = (1..number)
  end

  def square_of_sum
    number_series.sum.pow(2)
  end

  def sum_of_squares
    number_series.sum { |n| n.pow(2) }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  attr_reader :number_series
end