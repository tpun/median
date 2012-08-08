class Median
  def initialize
    @sorted = []
  end

  def add n
    @sorted << n
    @sorted.sort!

    if @sorted.length.odd?
      return @sorted[@sorted.length/2].to_s
    else
      middle2 = @sorted.length / 2
      middle1 = middle2 - 1
      median = (@sorted[middle1] + @sorted[middle2])/2.0
      median = median.to_i if median.to_i==median
      return median.to_s
    end
  end

  def remove n
    return 'Wrong!' unless @sorted.include? n
  end
end