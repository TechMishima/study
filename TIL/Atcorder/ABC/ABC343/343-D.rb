N, T = gets.split.map(&:to_i)

menbers = []
N.times { menbers << 0 }

answers = []
T.times do
  line = gets.split.map(&:to_i)
  menbers[line[0] - 1] += line[1]
  # puts menbers.uniq.length
  answers << menbers.uniq.length
end

puts "ここから答え"
answers.each { |answer| puts answer }