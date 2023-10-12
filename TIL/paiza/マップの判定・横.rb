line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
lines = []
H.times do
    line = gets
    lines << line
end

counts = 0
lines.each do |line|
    W.times do |i|
        if (line[i - 1] == "#" || i == 0) && (line[i + 1] == "#" || i == (W - 1))
            puts "#{counts} #{i}"
        end
    end
    counts += 1
end