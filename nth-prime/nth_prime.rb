class Prime
  class << self
    def nth(n)
      raise ArgumentError if n < 1

      counter = 1
      i = 2
      while counter != n
        i += 1
        counter += 1 if is_prime?(i)
      end

      i
    end

    def is_prime?(n)
      (2..Math.sqrt(n)).none? { |divider| (n % divider).zero? }
    end
  end
end