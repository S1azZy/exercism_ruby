class Scrabble
  LETTER_VALUES = {
    /[AEIOULNRST]/ => 1,
    /[DG]/ => 2,
    /[BCMP]/ => 3,
    /[FHVWY]/ => 4,
    /[K]/ => 5,
    /[JX]/ => 8,
    /[QZ]/ => 10
  }.freeze

  def initialize(word)
    @letters = (word || '').upcase.scan(/\w/)
  end

  def score
    letters.sum { |letter| letter_values[letter] }
  end

  class << self
    def score(word)
      scrabble = new(word)
      scrabble.score
    end
  end

  private

  attr_reader :letters

  def letter_values
    @letter_values ||= ('A'..'Z').each_with_object({}) do |letter, acc|
      _, letter_value = LETTER_VALUES.find { |k, _| k.match?(letter) }
      acc[letter] = letter_value || 0
    end
  end
end