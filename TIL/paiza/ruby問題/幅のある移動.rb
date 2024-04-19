# データ取得
H, W, sy, sx, N = gets.split.map(&:to_i)
board = H.times.map {gets.chomp.split("")}

# 移動制御 move配列 now変数
move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
now = 0

y, x = sy, sx
board[y][x] = "*"
stop = false

# アルゴリズム
N.times do
    line = gets.split; d = line[0].chomp; length = line[1].to_i
    if d == "L"
        now -= 1
    elsif d == "R"
        now += 1
    end
    
    length.times do |i|
        ny = y + move[now % 4][0]
        nx = x + move[now % 4][1]
        if !(nx >= 0 && nx <= W - 1 && ny >= 0 && ny <= H - 1 && board[ny][nx] == ".")
            stop = true
            break
        end
        
        y, x = ny, nx
        board[y][x] = "*"
        
    end
    
    if stop == true
        break
    end
end

board.each do |board|
    puts board.join
end