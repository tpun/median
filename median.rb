class Median
  def initialize
    @sorted = []
  end

  def add n
    @sorted << n
    @sorted.sort!

    to_s
  end

  def remove n
    index = @sorted.index n
    return 'Wrong!' if index.nil?
    @sorted.delete_at index

    to_s
  end

  def to_s
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
end

# # Driver
# median = Median.new
# n = STDIN.readline.to_i
# n.times do
#   command, x = STDIN.readline.split ' '
#   case command
#   when 'a'
#     puts median.add x.to_i
#   when 'r'
#     puts median.remove x.to_i
#   end
# end