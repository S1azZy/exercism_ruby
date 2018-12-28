class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    correct? && uniq_sides_count == 1
  end

  def isosceles?
    correct? && (1..2).cover?(uniq_sides_count)
  end

  def scalene?
    correct? && uniq_sides_count == 3
  end

  def uniq_sides_count
    @uniq_sides_count ||= sides.uniq.size
  end

  def correct?
    sides.min > 0 &&
      sides.max <= sides.min(2).sum
  end
end