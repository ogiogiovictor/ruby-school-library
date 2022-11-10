require_relative '../solver'

describe '#Factorial' do
  before(:all) do
    @value = Solver.new
  end

  context 'an argument and return factorial' do
    it 'factorial of 5 to be 120' do
      expect(@value.factorial(5)).to eq(120)
    end

    it 'factorial of 0 to be 1' do
      expect(@value.factorial(0)).to eq(1)
    end

    it 'factorial of negative number to be not valid' do
      expect(@value.factorial(-5)).to eq('Not a valid number')
    end
  end
end

describe '#Reverse' do
  before(:all) do
    @value = Solver.new
  end

  context 'an argument and return a string reverse' do
    it 'reverse of Hello to be "olleH"' do
      expect(@value.reverse('Hello')).to eq('olleH')
    end

    it 'reverse of Good Morning to be "gninroM dooG"' do
      expect(@value.reverse('Good Morning')).to eq('gninroM dooG')
    end
  end
end
