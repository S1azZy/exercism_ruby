module Enumerable
  def accumulate
    return self unless block_given?

    reduce([]) do |acc, element|
      acc << (yield element)
    end
  end
end