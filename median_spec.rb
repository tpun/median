require_relative './median.rb'
describe 'Median' do
  subject { Median.new }

  describe '#add' do
    context 'when the list is odd number of numbers' do
      it 'adds input and outputs the middle number' do
        subject.add 10
        subject.add 20

        median = subject.add 30

        median.should == "20"
      end
    end

    context 'when the list is even number of numbers' do
      it 'adds input and outputs the median and drops the decimal point' do
        subject.add 10
        subject.add 20
        subject.add 30

        median = subject.add 40
        median.should == "25"
      end

      it 'adds input and outputs the average of the middle 2 numbers with decimal points' do
        subject.add 10
        subject.add 20
        subject.add 30

        median = subject.add 21
        median.should == "20.5"
      end
    end
  end

  describe '#remove' do
    context 'when the input is not in the list' do
      it 'outputs Wrong!' do
        (subject.remove 10).should == 'Wrong!'
      end
    end

    context 'when the input is in the list' do
      it 'removes input and output median'
    end
  end
end