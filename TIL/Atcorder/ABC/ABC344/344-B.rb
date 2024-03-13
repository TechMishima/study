line = readlines.map(&:chomp)

num = line.length

num.times do |i|
  puts line[num - 1 - i]
end