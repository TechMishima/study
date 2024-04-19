# データ取得
line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
startY = line[2].to_i; startX = line[3].to_i; D = line[4].chomp; M = line[5].chomp

map = []
H.times do
    line = gets.chomp
    map << line
end

# アルゴリズム

if D == "N"
    if M == "L"
        if map[startY][startX - 1] == "#" || startX == 0
            puts "No"
        else
            puts "Yes"
        end
    elsif M == "R"
        if map[startY][startX + 1] == "#" || startX == W - 1
            puts "No"
        else
            puts "Yes"
        end
    end
    
elsif D == "S"
    if M == "L"
        if map[startY][startX + 1] == "#" || startX == W - 1
            puts "No"
        else
            puts "Yes"
        end
    elsif M == "R"
        if map[startY][startX - 1] == "#" || startX == 0
            puts "No"
        else
            puts "Yes"
        end
    end

elsif D == "E"
    if M == "L"
        if map[startY - 1][startX] == "#" || startY == 0
            puts "No"
        else
            puts "Yes"
        end
    elsif M == "R"
        if map[startY + 1][startX] == "#" || startY == H - 1
            puts "No"
        else
            puts "Yes"
        end
    end
    
elsif D == "W"
    if M == "L"
        if map[startY + 1][startX] == "#" || startY == H - 1
            puts "No"
        else
            puts "Yes"
        end
    elsif M == "R"
        if map[startY - 1][startX] == "#" || startY == 0
            puts "No"
        else
            puts "Yes"
        end
    end

else
    puts "デバッグ"
end