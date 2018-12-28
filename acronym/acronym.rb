class Acronym
  class << self
    def abbreviate(str)
      str
        .scan(/\b\w/)
        .join
        .upcase
    end
  end
end