N = gets.to_i
line = gets.split.map(&:to_i)
sum = 0

line.each do |val|
    sum += val
    puts sum
end