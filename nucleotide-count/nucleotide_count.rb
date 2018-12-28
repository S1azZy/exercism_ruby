class Nucleotide
  class << self
    def from_dna(dna)
      raise ArgumentError if dna.match?(/[^ACGT]/)
      new(dna)
    end
  end

  attr_reader :dna

  def initialize(dna)
    @dna = dna
  end

  def count(nucleotide)
    histogram[nucleotide]
  end

  def histogram
    @histogram ||= dna.chars.each_with_object(default_histogram) do |nucleotide, acc|
      acc[nucleotide] += 1
    end
  end

  def default_histogram
    {
      'A' => 0,
      'T' => 0,
      'C' => 0,
      'G' => 0
    }
  end
end