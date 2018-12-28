class Change
  class NegativeTargetError < StandardError; end
  class ImpossibleCombinationError < StandardError; end

  class << self
    def generate(coins, amount)
      raise NegativeTargetError if amount < 0

      exchange_variants = generate_recursive(coins.sort.reverse, amount, [])

      raise ImpossibleCombinationError if exchange_variants.empty?

      exchange_variants.sort_by(&:size).first
    end

    def generate_recursive(coins, amount, variants)
      return variants if coins.empty?

      rest = amount
      exchange = []

      coins.each do |coin|
        factor, rest = rest.divmod(coin)

        exchange = [*Array.new(factor, coin), *exchange]
      end

      variants << exchange if rest.zero?

      _, *tail = coins
      generate_recursive(tail, amount, exchange)
    end

    def f(coins, amount, variants)
      # 1 возьмем одну монетку
      # 2 Если можем ее вычесть, то вычитаем.
      # 3 Если не можем
    end
  end
end