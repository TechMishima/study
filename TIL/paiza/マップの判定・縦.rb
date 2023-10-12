line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
lines = []
H.times do
    line = gets
    lines << line
end

num = 0
lines.each do |line|
    W.times do |i|
        if num == 0
            if lines[1][i] == "#"
                puts "#{num} #{i}"
            end
        elsif num == H - 1
            if lines[H - 2][i] == "#"
                puts "#{num} #{i}"
            end
        else
            if lines[num - 1][i] == "#" && lines[num + 1][i] == "#"
                puts "#{num} #{i}"
            end
        end
    end
    num += 1
end