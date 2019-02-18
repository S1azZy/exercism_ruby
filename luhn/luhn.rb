class Luhn
  def initialize(str)
    @str = str.delete("\s")
  end

  def self.valid?(str)
    new(str).perform
  end

  def perform
    return false if invalid_string_format?

    (checksum % 10).zero?
  end

  private

  attr_reader :str

  def invalid_string_format?
    str.size <= 1 || str.match?(/[^0-9]/)
  end

  def digits
    str.scan(/\d/).map(&:to_i)
  end

  def checksum
    digits
      .reverse
      .each_slice(2)
      .sum { |pair| calculate_pair_sum(pair) }
  end

  def calculate_pair_sum(pair)
    first, second = pair
    second = second.to_i * 2
    second -= 9 if second > 9

    first + second
  end
end