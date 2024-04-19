# データの取得
line = gets.split(" "); Y = line[0].to_i; X = line[1].to_i; D = line[2]
d = gets.chomp
tate = Y
yoko = X

# アルゴリズム
if D == "N"
    if d == "L"
        yoko -= 1
    elsif d == "R"
        yoko += 1
    end
end
if D == "S"
    if d == "L"
        yoko += 1
    elsif d == "R"
        yoko -= 1
    end
end
if D == "E"
    if d == "L"
        tate -= 1
    elsif d == "R"
        tate += 1
    end
end
if D == "W"
    if d == "L"
        tate += 1
    elsif d == "R"
        tate -= 1
    end
end

# 答えの出力
puts "#{tate} #{yoko}"