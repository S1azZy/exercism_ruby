class Robot
  DIRECTIONS = {
    north: {
      action: ->(x, y) { [x, y + 1] },
      left: :west,
      right: :east
    },
    south: {
      action: ->(x, y) { [x, y - 1] },
      left: :east,
      right: :west
    },
    east: {
      action: ->(x, y) { [x + 1, y] },
      left: :north,
      right: :south
    },
    west: {
      action: ->(x, y) { [x - 1, y] },
      left: :south,
      right: :north
    }
  }.freeze

  attr_reader :bearing, :x, :y

  def initialize
    at(0, 0)
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.key?(direction)

    @bearing = direction
  end

  def turn_right
    @bearing = current_direction[:right]
  end

  def turn_left
    @bearing = current_direction[:left]
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def current_direction
    DIRECTIONS[bearing]
  end

  def coordinates
    [x, y]
  end

  def advance
    new_coords = current_direction[:action].call(*coordinates)
    at(*new_coords)
  end
end

class Simulator
  COMMANDS_MAPPING = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }.freeze

  def instructions(list)
    list.scan(/\w/).map { |command| COMMANDS_MAPPING[command] }
  end

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, list)
    commands = instructions(list)
    commands.each do |command|
      robot.send(command)
    end
  end
end