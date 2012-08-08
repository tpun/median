# Driver
median = Median.new
n = STDIN.readline.to_i
n.times do
  command, x = STDIN.readline.split ' '
  case command
  when 'a'
    puts median.add x.to_i
  when 'r'
    puts median.remove x.to_i
  end
end