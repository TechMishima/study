target = gets.chomp
n = gets.to_i
bags = []
n.times do
  line = gets.chomp.split
  line[0] = ""
  bags << line
end

n.times do ||