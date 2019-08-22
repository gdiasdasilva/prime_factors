require_relative '../bin/prime_factorization'

describe PrimeFactorization do
  describe '#prime_factors' do
    context 'when number is prime' do
      it 'should return the number itself' do
        result_factors = described_class.new(17).prime_factors
        expect(result_factors).to eq '17'
      end
    end

    context 'when number is not prime' do
      it 'should return all the factors' do
        result_factors = described_class.new(190).prime_factors
        expect(result_factors).to eq '2, 5, 19'
      end
    end

    context 'when number is 1' do
      it 'should return no factors' do
        result_factors = described_class.new(1).prime_factors
        expect(result_factors).to eq ''
      end
    end
  end
end
