class Phrase
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def word_count
    text
      .downcase
      .scan(/(?:\w+'?\w+|\d)/)
      .each_with_object({}) do |word, acc|
      acc[word] = acc.fetch(word, 0) + 1
    end
  end
end