require_relative './median.rb'
describe 'Median' do
  subject { Median.new }

  describe '#add' do
    it 'adds input and output median'
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