class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(possible_anagrams)
    possible_anagrams.filter do |possible_anagram|
      word != possible_anagram.downcase &&
        word.chars.sort == possible_anagram.downcase.chars.sort
    end.sort
  end
end