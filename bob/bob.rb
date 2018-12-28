class Bob
  class << self
    def hey(remark)
      question = remark.strip.end_with?('?')
      yell = remark.match?(/[a-zA-Z]/) && (remark.upcase == remark)
      silence = !remark.match?(/\w/)

      if question && yell
        "Calm down, I know what I'm doing!"
      elsif question
        'Sure.'
      elsif yell
        'Whoa, chill out!'
      elsif silence
        'Fine. Be that way!'
      else
        'Whatever.'
      end
    end
  end
end