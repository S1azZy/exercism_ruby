class BaseConverter
  class << self
    def convert(input_base, digits, output_base)
      digits = digits.dup.drop_while(&:zero?)

      validate!(input_base, digits, output_base)

      decimal_digit = to_decimal(input_base, digits)
      decimal_to_base(decimal_digit, output_base)
    end

    def to_decimal(base, digits)
      result = digits.reverse.each_with_index.sum do |digit, index|
        digit * (base**index)
      end
      result || 0
    end

    def decimal_to_base(decimal_digit, base)
      result = []
      rest = decimal_digit
      while rest != 0
        rest, base_digit = rest.divmod(base)
        result << base_digit
      end

      result << 0 if result.empty?

      result.reverse
    end

    def validate!(input_base, digits, output_base)
      raise ArgumentError if input_base < 2 || output_base < 2

      raise ArgumentError if digits.find { |digit| digit < 0 || digit >= input_base }
    end
  end
end