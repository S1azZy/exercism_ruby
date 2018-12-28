class Hamming
  class << self
    def compute(dna_one, dna_second)
      raise ArgumentError if dna_one.size != dna_second.size

      (0...dna_one.size).count do |index|
        dna_one[index] != dna_second[index]
      end
    end
  end
end