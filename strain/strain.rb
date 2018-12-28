module Enumerable
  def keep
    return self unless block_given?

    reduce([]) do |acc, element|
      acc << element if yield element
      acc
    end
  end

  def discard
    return self unless block_given?

    reduce([]) do |acc, element|
      acc << element unless yield element
      acc
    end
  end
end
