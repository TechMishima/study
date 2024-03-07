num = gets.to_i

answers = []
num.times do
  answer = []
  line = gets.chomp.split
  num.times do |i|
    if line[i] == "1"
      answer << i + 1
    end
  end
  answers << answer
end

answers.each do |answer|
  puts answer.join(" ")
end