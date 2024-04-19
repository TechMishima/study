# データ取得
line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
startY = line[2].to_i; startX = line[3].to_i; M = line[4].chomp

map = []
H.times do
    line = gets.chomp
    map << line
end

# アルゴリズム

if M == "N"
    if map[startY - 1][startX] == "#" || startY == 0
        puts "No"
    else
        puts "Yes"
    end
elsif M == "S"
    if map[startY + 1][startX] == "#" || startY == H - 1
        puts "No"
    else
        puts "Yes"
    end
elsif M == "W"
    if map[startY][startX - 1] == "#" || startX == 0
        puts "No"
    else
        puts "Yes"
    end
elsif M == "E"
    if map[startY][startX + 1] == "#" || startX == W - 1
        puts "No"
    else
        puts "Yes"
    end
else
    puts "デバッグ"
end