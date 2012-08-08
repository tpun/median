class Median
  def initialize
    @sorted = []
  end

  def add n
  end

  def remove n
    return 'Wrong!' unless @sorted.include? n
  end
end