h, w = gets.split.map(&:to_i)
board = h.times.map{ gets.chomp.split("") }
a, b = 0
search = false
board.each.with_index do |row, indexa|
    row.each.with_index do |square, indexb|
        if square == "*"
            a, b = indexa, indexb
            search = true
        end
    end
    break if search == true
end

d = "デバッグ"

board[a][b] = 1
num = 1
stop = false
count = 1
while num >= count do
    board.each.with_index do |row, s|
        row.each.with_index do |val, t|
            if val == count
                if s != 0 && board[s - 1][t] == "." && board[s - 1][t] != "#"
                    num += 1
                    board[s - 1][t] = num
                end
                if s != h - 1 && board[s + 1][t] == "." && board[s + 1][t] != "#"
                    num += 1
                    board[s + 1][t] = num
                end
                if  t != 0 && board[s][t - 1] == "." && board[s][t - 1] != "#"
                    num += 1
                    board[s][t - 1] = num
                end
                if !(t == w - 1) && board[s][t + 1] == "." && board[s][t + 1] != "#"
                    num += 1
                    board[s][t + 1] = num
                end
            end
        end
    end
count += 1
end

board.each.with_index do |row, s|
    row.each.with_index do |val, t|
        if val.to_i > 0
            board[s][t] = "*"
        end
    end
end

board.each do |row|
    puts row.join
end