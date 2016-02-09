class MoneyImplementor
  def initialize(amount)
    @amount = amount
  end

  attr_reader :amount

  def sum(value)
    @amount += value
  end
end

class TaxAbstraction
  def initialize(money)
    @money = money
  end

  def calculate
    raise 'Should be implemented in a sub class'
  end

  def sum_fee(fee)
    @money.sum(fee)
    @money.amount
  end
end

class FreeTax < TaxAbstraction
  FEE_PERCENTAGE = 0

  def calculate
    fee = @money.amount * FEE_PERCENTAGE
    sum_fee(fee)
  end
end

class LuxuryTax < TaxAbstraction
  FEE_PERCENTAGE = 0.5
  FIX_FEE = 10

  def calculate
    fee = (@money.amount * FEE_PERCENTAGE) + FIX_FEE
    sum_fee(fee)
  end
end


class TaxesCalculator
  def self.calculate(amount)
    {
      free: FreeTax.new(MoneyImplementor.new(amount)).calculate,
      luxury: LuxuryTax.new(MoneyImplementor.new(amount)).calculate
    }
  end
end
