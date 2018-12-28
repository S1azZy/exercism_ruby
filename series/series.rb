class Series
  attr_reader :str

  def initialize(str)
    @str = str
  end

  def slices(n)
    raise ArgumentError if n > str.size

    (0..(str.size - n)).map do |index|
      str.slice(index, n)
    end
  end
end