target = gets.chomp
n = gets.to_i
bags = []
n.times do
  line = gets.chomp.split
  line.push("")
  bags << line
end

n.times do |i|
  num = bags[i].shift
end