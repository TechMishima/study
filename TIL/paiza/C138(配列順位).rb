N = gets.to_i
menbers = []
N.times do
    line = gets.to_i
    menbers << line
end

answer = []
N.times do
    answer << 0
end

rank = 1
counts = 0
sum = 0
while counts < N do
    max = menbers.max
    N.times do |i|
        if menbers[i] == max
            menbers[i] = 0
            answer[i] = rank
            sum += 1
            counts += 1
        end
    end
    rank += sum
    sum = 0
end
puts answer