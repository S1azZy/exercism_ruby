class SpaceAge
  EARTH_YEAR = 31_557_600
  ORBITAL_PERIODS =
    {
      earth: 1,
      mercury: 0.2408467,
      venus: 0.61519726,
      mars: 1.8808158,
      jupiter: 11.862615,
      saturn: 29.447498,
      uranus: 84.016846,
      neptune: 164.79132
    }.freeze

  ORBITAL_PERIODS.each_key do |planet|
    define_method("on_#{planet}") do
      calculate_age(planet)
    end
  end

  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  private

  def calculate_age(planet)
    seconds / (EARTH_YEAR.to_f * ORBITAL_PERIODS[planet])
  end
end