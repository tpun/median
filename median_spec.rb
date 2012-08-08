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
      it 'removes input and output median' do
        subject.add 1
        subject.add 2
        subject.add 1

        (subject.remove 1).should == '1.5'
      end

      it 'remvoes and outputs Wrong! if last number is removed' do
        subject.add 1

        (subject.remove 1).should == 'Wrong!'
      end
    end
  end
end

describe 'SortedArray' do
  subject { SortedArray.new }

  describe '#add' do
    it 'adds input to the right location' do
      subject.add 10
      subject.should == [10]

      subject.add 20
      subject.should == [10, 20]

      subject.add 30
      subject.should == [10, 20, 30]

      subject.add 11
      subject.should == [10, 11, 20, 30]

      subject.add 9
      subject.should == [9, 10, 11, 20, 30]
    end
  end

  describe '#delete' do
    context 'when the array is empty' do
      it 'always returns nil' do
        (subject.delete mock).should be_nil
      end
    end

    context 'when the array is not empty' do
      before do
        subject.add 10
        subject.add 20
        subject.add 30
      end

      it 'returns nil if input object is not found' do
        (subject.delete 40).should be_nil
      end

      it 'returns input object if found' do
        (subject.delete 30).should == 30
      end
    end
  end

  describe '#insertion_index' do
    it 'returns 0 if empty' do
      (subject.insertion_index 10).should == 0
    end

    it 'returns length if input is biggest' do
      subject = SortedArray.new [10, 20, 30]
      (subject.insertion_index 40).should == 3
    end

    it 'returns the index of the largest element which is less than input' do
      subject = SortedArray.new [10, 20, 30]
      (subject.insertion_index 9).should == 0
      (subject.insertion_index 11).should == 1
      (subject.insertion_index 19).should == 1
      (subject.insertion_index 21).should == 2
      (subject.insertion_index 29).should == 2
      (subject.insertion_index 31).should == 3
    end
  end
end