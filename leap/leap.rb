class Year
  class << self
    def leap?(year)
      (year % 4).zero? &&
        ((year % 400).zero? || year % 100 != 0)
    end
  end
end