N, K = gets.split.map(&:to_i)
sums = [0]
sum = 0
N.times do
    line = gets.to_i
    sum += line
    sums << sum
end

K.times do
    line = gets.split.map(&:to_i)
    puts sums[line[1]] - sums[line[0] - 1]
end