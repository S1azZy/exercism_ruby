class Luhn
  def initialize(str)
    @str = str
  end

  def self.valid?(str)
    new(str).valid_number?
  end

  def valid_number?
    return false if invalid_format?

    (digits_sum % 10).zero?
  end

  private

  attr_reader :str

  def cleaned_str
    @cleaned_str ||= str.delete("\s")
  end

  def invalid_format?
    cleaned_str.size <= 1 || cleaned_str.match?(/[^0-9]/)
  end

  def digits
    cleaned_str
      .scan(/\d/)
      .join
      .yield_self(&:to_i)
      .digits
  end

  def digits_sum
    digits
      .each_slice(2)
      .sum { |(first, second)| calculate_sum(first, second) }
  end

  def calculate_sum(first, second)
    second = second.to_i * 2
    second -= 9 unless second < 10

    first + second
  end
end