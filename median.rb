class Median
  def initialize
    @sorted = SortedArray.new
  end

  def add n
    @sorted.add n

    to_s
  end

  def remove n
    deleted = @sorted.delete n
    return 'Wrong!' if @sorted.empty? || deleted.nil?

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

class SortedArray < Array
  def add obj
    pos = insertion_index obj
    insert pos, obj
  end

  def delete obj
    pos = insertion_index obj
    return delete_at pos if self[pos] == obj
    return delete_at pos-1 if self[pos-1] == obj
    nil
  end

  def insertion_index obj, range_start=0, range_end=length-1
    return 0 if length == 0 || obj <= first
    return length if obj >= last

    mid = (range_start + range_end) / 2
    mid2= [mid+1, length].min
    # puts "checking: #{self[range_start]} @ #{range_start} - #{self[range_end]} @ #{range_end}, mid: #{self[mid]} @ #{mid} mid2: #{self[mid2]} @ #{mid2}"
    return mid2 if self[mid] <= obj && obj <= self[mid2]

    if obj < self[mid]
      return insertion_index obj, range_start, mid
    elsif self[mid] < obj
      return insertion_index obj, mid, range_end
    else
      return mid2
    end
  end
end