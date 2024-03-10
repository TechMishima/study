N = gets.to_i
S = gets.chomp.split("")
Q = gets.to_i

Q.times do
  line = gets.chomp.split
  S.each.with_index do |val, i|
    if val == line[0]
      S[i] = line[1]
    end
  end
end

puts S.join