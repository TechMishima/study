# データ取得
line = gets.split(" "); X = line[0].to_i; Y = line[1].to_i; N = line[2].to_i
direction = "N"
now = {yoko: X, tate: Y}

# アルゴリズム
N.times do
    line = gets.chomp
    switch = line
    # 北向きの場合
    if direction == "N"
        #puts "北向きで処理"
        if switch == "L"
            now[:yoko] -= 1
            direction = "W"
        elsif switch == "R"
            now[:yoko] += 1
            direction = "E"
        end
    
    # 南向きの場合
    elsif direction == "S"
        #puts "南向きで処理"
        if switch == "L"
            now[:yoko] += 1
            direction = "E"
        elsif switch == "R"
            now[:yoko] -= 1
            direction = "W"
        end
    
    # 東向きの場合
    elsif direction == "E"
        #puts "東向きで処理"
        if switch == "L"
            now[:tate] -= 1
            direction = "N"
        elsif switch == "R"
            now[:tate] += 1
            direction = "S"
        end
    
    # 西向きの場合
    elsif direction == "W"
        #puts "西向きで処理"
        if switch == "L"
            now[:tate] += 1
            direction = "S"
        elsif switch == "R"
            now[:tate] -= 1
            direction = "N"
        end
    end
    
    puts "#{now[:yoko]} #{now[:tate]}"
end