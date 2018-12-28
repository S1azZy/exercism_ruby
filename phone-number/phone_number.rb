class PhoneNumber
  PHONE_REGEX = /^(?:1?)(?<area>[2-9]\d{2})(?<local>[2-9]\d{6})$/

  class << self
    def clean(number)
      digits = number.gsub(/[-+()\s\.]/, '')
      groups = digits.match(PHONE_REGEX)
      return nil if groups.nil?

      "#{groups[:area]}#{groups[:local]}"
    end
  end
end