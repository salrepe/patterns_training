require_relative 'taxes_calculator'

describe MoneyImplementor do
  describe '#sum' do
    it 'sums the given amount' do
      money = described_class.new(100_00)
      money.sum(10)

      expect(money.amount).to eq(100_10)
    end
  end
end


describe FreeTax do
  describe '#calculate' do
    it 'returns the amount resultant after applying the free tax fee' do
      money = MoneyImplementor.new(100_00)
      free_tax = described_class.new(money)

      expect(free_tax.calculate).to eq(100_00)
    end
  end
end

describe LuxuryTax do
  it 'returns the amount resultant after applying the luxury tax fee' do
    money = MoneyImplementor.new(100_00)
    luxury_tax = described_class.new(money)

    expect(luxury_tax.calculate).to eq(150_10)
  end
end

describe TaxesCalculator do
  it 'returns the different taxes and its values for a given amount' do
    expect(TaxesCalculator.calculate(200_00)).to eq(free: 200_00, luxury: 300_10)
  end
end
