class FlattenArray
  class << self
    # the Ruby way - list.flatten.compact
    # but my solution more interesting, i think so :)
    def flatten(list)
      iter(*list)
    end

    def iter(head = nil, *tail)
      return [] if head.nil?

      node =
        case head
        when Array
          iter(*head)
        else
          [head]
        end

      node + iter(*tail)
    end
  end
end