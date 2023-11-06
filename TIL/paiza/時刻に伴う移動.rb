h, w, sy, sx, n = gets.split.map(&:to_i)
board = h.times.map { gets.chomp.split('') }

move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
now = 0

y, x = sy, sx
stop = false
time = 0
n.times do
    # データ取得
    line = gets.split(" ")
    t, d = line[0].to_i, line[1]
    
    
    # 移動する
    (t - time).times do
        ny = y + move[now % 4][0]
        nx = x + move[now % 4][1]
        if !(0 <= ny && ny <= h - 1 && 0 <= nx && nx <= w - 1 && board[ny][nx] != '#')
            puts 'Stop'
            stop = true
            break
        end
        y, x = ny, nx
        puts y.to_s + ' ' + x.to_s
    end
    time += (t - time)
    # puts time
    
    
    # 方向転換
    if d == 'L'
        # puts "左"
        now -= 1
    else
        now += 1
        # puts "右"
    end
    
    
    # break
    if stop == true
        break
    end
end