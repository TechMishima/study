# データ取得
line = gets.split(" "); N = line[0].to_i; K = line[1].to_i

players = []
N.times do |i|
    line = gets.split(" ")
    player = {num: i + 1,
        hp: line[0].to_i,
        frame1: line[1].to_i,
        attack1: line[2].to_i,
        frame2: line[3].to_i,
        attack2: line[4].to_i,
        frame3: line[5].to_i,
        attack3: line[6].to_i}
    players << player
end

# アルゴリズム
K.times do
    # 行動のデータ取得
    line = gets.split(" ")
    playerA = players[line[0].to_i - 1]
    playerB = players[line[2].to_i - 1]
    if (playerA[:hp] > 0) && (playerB[:hp] > 0)
        # Aのフレームと攻撃
        if line[1] == "1"
            attackA = playerA[:attack1]
            frameA = playerA[:frame1]
        elsif line[1] == "2"
            attackA = playerA[:attack2]
            frameA = playerA[:frame2]
        elsif line[1] == "3"
            attackA = playerA[:attack3]
            frameA = playerA[:frame3]
        end
        # Bのフレームと攻撃
        if line[3] == "1"
            attackB = playerB[:attack1]
            frameB = playerB[:frame1]
        elsif line[3] == "2"
            attackB = playerB[:attack2]
            frameB = playerB[:frame2]
        elsif line[3] == "3"
            attackB = playerB[:attack3]
            frameB = playerB[:frame3]
        end
        # AvsBの計算(バフ)
        if frameA == 0 && attackA == 0
            if players[line[0].to_i - 1][:attack1] != 0
                players[line[0].to_i - 1][:attack1] += 5
            end
            if players[line[0].to_i - 1][:attack2] != 0
                players[line[0].to_i - 1][:attack2] += 5
            end
            if players[line[0].to_i - 1][:attack3] != 0
                players[line[0].to_i - 1][:attack3] += 5
            end
            if players[line[0].to_i - 1][:frame1] >= 4
                players[line[0].to_i - 1][:frame1] -= 3
            elsif players[line[0].to_i - 1][:frame1] >= 1
                players[line[0].to_i - 1][:frame1] = 1
            end
            if players[line[0].to_i - 1][:frame2] >= 4
                players[line[0].to_i - 1][:frame2] -= 3
            elsif players[line[0].to_i - 1][:frame2] >= 1
                players[line[0].to_i - 1][:frame2] = 1
            end
            if players[line[0].to_i - 1][:frame3] >= 4
                players[line[0].to_i - 1][:frame3] -= 3
            elsif players[line[0].to_i - 1][:frame3] >= 1
                players[line[0].to_i - 1][:frame3] = 1
            end
        end
        if frameB == 0 && attackB == 0
            if players[line[2].to_i - 1][:attack1] != 0
                players[line[2].to_i - 1][:attack1] += 5
            end
            if players[line[2].to_i - 1][:attack2] != 0
                players[line[2].to_i - 1][:attack2] += 5
            end
            if players[line[2].to_i - 1][:attack3] += 0
                players[line[2].to_i - 1][:attack3] += 5
            end
            if players[line[2].to_i - 1][:frame1] >= 4
                players[line[2].to_i - 1][:frame1] -= 3
            elsif players[line[2].to_i - 1][:frame1] >= 1
                players[line[2].to_i - 1][:frame1] = 1
            end
            if players[line[2].to_i - 1][:frame2] >= 4
                players[line[2].to_i - 1][:frame2] -= 3
            elsif players[line[2].to_i - 1][:frame2] >= 1
                players[line[2].to_i - 1][:frame2] = 1
            end
            if players[line[2].to_i - 1][:frame3] >= 4
                players[line[2].to_i - 1][:frame3] -= 3
            elsif players[line[2].to_i - 1][:frame3] >= 1
                players[line[2].to_i - 1][:frame3] = 1
            end
        end
        #AvsBの計算（戦い）
        if frameA == 0
            players[line[0].to_i - 1][:hp] -= attackB
        elsif frameB == 0
            players[line[2].to_i - 1][:hp] -= attackA
        else
            if frameA < frameB
                players[line[2].to_i - 1][:hp] -= attackA
            elsif frameB < frameA
                players[line[0].to_i - 1][:hp] -= attackB
            end
        end
        
    end
end

#答えの出力
sum = 0
players.each do |player|
    if player[:hp] > 0
        sum += 1
    end
end
puts sum