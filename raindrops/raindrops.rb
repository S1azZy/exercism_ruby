class Raindrops
  class << self
    def convert(number)
      mapping = {
        3 => 'Pling',
        5 => 'Plang',
        7 => 'Plong'
      }

      mapping
        .map { |(divider, name)| name if (number % divider).zero?}
        .join
        .then { |result| result.empty? ? number.to_s : result }
    end
  end
end