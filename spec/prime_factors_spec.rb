require_relative '../bin/prime_factors'

describe 'prime_factors' do

  describe 'prime?' do
    context 'when number is prime' do
      it 'should return true' do
        expect(prime?(5)).to eq true
      end
    end

    context 'when number is not prime' do
      it 'should return false' do
        expect(prime?(10)).to eq false
      end
    end
  end

  describe 'primes_until' do
    context 'when number has inferior prime numbers' do
      it 'should return an array with inferior numbers' do
        expect(primes_until(5)).to eq [2, 3, 5]
      end
    end

    context 'when number does not have inferior prime numbers' do
      it 'should return an empty array' do
        expect(primes_until(1)).to eq []
      end
    end
  end

  describe 'minimal_divisible_factor' do
    context 'when number has prime factors' do
      it 'should return the first divisible prime factor' do
        expect(minimal_divisible_factor(10)).to eq 2
        expect(minimal_divisible_factor(17)).to eq 17
      end
    end

    context 'when number does not have prime factors' do
      it 'should return nil' do
        expect(minimal_divisible_factor(1)).to eq nil
      end
    end
  end

  describe 'prime_factors' do
    context 'when number has prime factors' do
      it 'should return the array of prime factors' do
        expect(prime_factors(17)).to eq [17]
        expect(prime_factors(25)).to eq [5, 5]
        expect(prime_factors(90)).to eq [2, 3, 3, 5]
      end
    end

    context 'when number does not have prime factors' do
      it 'should return an empty array' do
        expect(prime_factors(1)).to eq []
      end
    end
  end

  describe 'main' do
    context 'when number is valid' do
      it 'should return a comma separated list of prime factors' do
        expect(main(12)).to eq '2, 2, 3'
        expect(main(17)).to eq '17'
      end
    end

    context 'when number is invalid' do

    end
  end

end
