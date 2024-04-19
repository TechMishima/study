# データ取得
line = gets.split(" "); H = line[0].to_i; W = line[1].to_i; N = line[2].to_i; K = line[3].to_i

kougu = []
10.times do
    line = gets.split(" ")
    box = {x: line[0].to_i, y: line[1].to_i}
    kougu << box
end

robots = []
N.times do
    line = gets.split(" ")
    robot = [line[0].to_i, line[1].to_i, line[2].to_i]
    robots << robot
end

# クラス作成
# ロボットの移動
def move(robots, num, way)
    #移動距離
    if robots[num][2] == 1
        length = 1
    elsif robots[num][2] == 2
        length = 2
    elsif robots[num][2] == 3
        length = 5
    elsif robots[num][2] == 4
        length = 10
    end
        
    #移動する
    if way == "N"
        robots[num][1] -= length
        # if robots[num][1] < H * (-1) #マス目の限界はいらなかった
        #     robots[num][1] = H * (-1)
        # end
    elsif way == "S"
        robots[num][1] += length
        # if robots[num][1] > H
        #     robots[num][1] = H
        # end
    elsif way == "W"
        robots[num][0] -= length
        # if robots[num][0] < W * (-1)
        #     robots[num][0] = W * (-1)
        # end
    elsif way == "E"
        robots[num][0] += length
        # if robots[num][0] > W
        #     robots[num][0] = W
        # end
    end
end
# 工具箱でレベルアップ
def levelup(robots, kougu, num)
    kougu.each do |box|
        if robots[num][0] == box[:x] && robots[num][1] == box[:y]
            robots[num][2] += 1
            if robots[num][2] == 5
                robots[num][2] = 4
            end
        end
    end
end

# アルゴリズム
K.times do
    line = gets.split(" ")
    num = line[0].to_i - 1
    way = line[1]
    move(robots, num, way)
    levelup(robots, kougu, num)
end

# 答えの出力
robots.each do |robot|
    puts robot.join(" ")
end