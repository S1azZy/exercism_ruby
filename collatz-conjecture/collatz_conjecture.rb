class CollatzConjecture
  class << self
    def steps(n)
      raise ArgumentError if n < 1
      steps_recursive(n, 0)
    end

    def steps_recursive(n, steps_count)
      return steps_count if n == 1

      current =
        if (n % 2).zero?
          n / 2
        else
          3 * n + 1
        end

      steps_recursive(current, steps_count + 1)
    end
  end
end