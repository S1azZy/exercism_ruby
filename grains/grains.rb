class Grains
  AVAILABLE_NUMBERS = (0..63)

  class << self
    def square(number)
      number -= 1
      raise ArgumentError unless AVAILABLE_NUMBERS.cover?(number)

      pow(number)
    end

    def total
      AVAILABLE_NUMBERS.sum { |n| pow(n) }
    end

    private

    def pow(exp)
      2.pow(exp)
    end
  end
end