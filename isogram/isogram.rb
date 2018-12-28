class Isogram
  class << self
    def isogram?(str)
      letters = str.downcase.scan(/\w/)

      letters.size == letters.uniq.size
    end
  end
end