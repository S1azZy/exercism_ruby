class Complement
  class << self
    def of_dna(rna)
      replacement = {
        'G' => 'C',
        'C' => 'G',
        'T' => 'A',
        'A' => 'U'
      }

      rna.gsub(/[GCTA]/, replacement)
    end
  end
end