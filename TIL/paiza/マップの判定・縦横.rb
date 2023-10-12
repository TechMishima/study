line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
lines = []
H.times do
    line = gets
    lines << line
end

# 縦判定
def Tate(lines, counts, i)
    if counts == 0
        if lines[1][i] == "#"
            puts "#{counts} #{i}"
        end
    elsif counts == H - 1
        if lines[H - 2][i] == "#"
            puts "#{counts} #{i}"
        end
    else
        if lines[counts - 1][i] == "#" && lines[counts + 1][i] == "#"
            puts "#{counts} #{i}"
        end
    end
end

# 横判定
counts = 0
lines.each do |line|
    W.times do |i|
        if (line[i - 1] == "#" || i == 0) && (line[i + 1] == "#" || i == (W - 1))
            Tate(lines, counts, i) # 縦counts 横i
        end
    end
    counts += 1
end