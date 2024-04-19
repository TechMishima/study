line = gets.split(" "); H = line[0].to_i; W = line[1].to_i; N = line[2].to_i
lines = []
H.times do
    line = gets
    lines << line
end

N.times do
    line = gets.split(" ")
    puts lines[line[0].to_i][line[1].to_i]
end