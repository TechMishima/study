h, w, sy, sx, n = gets.split.map(&:to_i)
board = h.times.map { gets.chomp.split('') }

move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
now = 0

turns = n.times.map { gets.split }

y, x = sy, sx
board[y][x] = "*"
t, d = turns.shift; t = t.to_i
100.times do |time|
    if t == time
        if d == 'L'
            now -= 1
        else
            now += 1
        end
        t, d = turns.shift if !turns.empty?
        t = t.to_i
    end
    
    ny = y + move[now % 4][0]
    nx = x + move[now % 4][1]
    if !(0 <= ny && ny <= h - 1 && 0 <= nx && nx <= w - 1 && board[ny][nx] != '#' && board[ny][nx] != '*')
        break
    end
    
    y, x = ny, nx
    board[y][x] = "*"
end

board.each do |line|
    puts line.join
end