class Pangram
  class << self
    def pangram?(sentence)
      english_alphabet = ('a'..'z').to_a

      letters =
        sentence
          .downcase
          .scan(/\w/)
          .uniq

      # maybe check letters.size == 26 will be better
      (english_alphabet - letters).empty?
    end
  end
end