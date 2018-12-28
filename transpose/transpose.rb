class Transpose
  class << self
    def transpose(matrix)
      return matrix if matrix.empty?

      lines = matrix.split(/\n/)

      arrays_of_chars = lines.reverse.reduce([]) do |acc, line|
        size = [acc.first&.size || 0, line.size].max
        padding_line = line.chars + Array.new(size - line.size, ' ')

        [padding_line, *acc]
      end

      head, *tail = arrays_of_chars

      result =
        if tail.empty?
          head.zip
        else
          head.zip(*tail)
        end

      result.map(&:join).join("\n")
    end
  end
end