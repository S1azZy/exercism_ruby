class Luhn
  def self.valid?(str)
    return false unless valid_string_format?(str)

    digits_from_string(str)
      .reverse
      .each_slice(2)
      .sum { |pair| calculate_pair_sum(pair) }
      .yield_self { |result| (result % 10).zero? }
  end

  def self.valid_string_format?(str)
    str = str.gsub(/\s/, '')

    str.size > 1 && !str.match?(/[^0-9]/)
  end

  def self.digits_from_string(str)
    str.scan(/\d/).map(&:to_i)
  end

  def self.calculate_pair_sum(pair)
    first, second = *pair
    second = (second || 0) * 2
    second -= 9 if second > 9

    first + second
  end

  private_class_method :calculate_pair_sum, :digits_from_string, :valid_string_format?
end