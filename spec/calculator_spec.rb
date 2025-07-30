require_relative '../lib/calculator'

RSpec.describe Calculator do
  let(:calculator) { Calculator.new }

  describe '#add' do
    it 'adds two positive numbers' do
      expect(calculator.add(2, 3)).to eq(5)
    end

    it 'adds positive and negative numbers' do
      expect(calculator.add(5, -2)).to eq(3)
    end

    it 'adds two negative numbers' do
      expect(calculator.add(-3, -4)).to eq(-7)
    end
  end

  describe '#subtract' do
    it 'subtracts two positive numbers' do
      expect(calculator.subtract(5, 3)).to eq(2)
    end

    it 'subtracts negative from positive' do
      expect(calculator.subtract(5, -2)).to eq(7)
    end

    it 'subtracts positive from negative' do
      expect(calculator.subtract(-5, 2)).to eq(-7)
    end
  end

  describe '#multiply' do
    it 'multiplies two positive numbers' do
      expect(calculator.multiply(3, 4)).to eq(12)
    end

    it 'multiplies by zero' do
      expect(calculator.multiply(5, 0)).to eq(0)
    end

    it 'multiplies negative numbers' do
      expect(calculator.multiply(-3, -4)).to eq(12)
    end

    it 'multiplies positive and negative' do
      expect(calculator.multiply(3, -4)).to eq(-12)
    end
  end

  describe '#divide' do
    it 'divides two positive numbers' do
      expect(calculator.divide(8, 2)).to eq(4)
    end

    it 'divides negative numbers' do
      expect(calculator.divide(-8, -2)).to eq(4)
    end

    it 'divides positive by negative' do
      expect(calculator.divide(8, -2)).to eq(-4)
    end

    it 'raises error when dividing by zero' do
      expect { calculator.divide(5, 0) }.to raise_error(ArgumentError, "Cannot divide by zero")
    end
  end
end 