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

board[a][b] = 0
num = 1
stop = false
count = 0
while stop == false do
stop = true
    board.each.with_index do |row, s|
        row.each.with_index do |val, t|
            if val == count
                if s != 0 && board[s - 1][t] == "." && board[s - 1][t] != "#"
                    board[s - 1][t] = num
                    stop = false
                end
                if s != h - 1 && board[s + 1][t] == "." && board[s + 1][t] != "#"
                    board[s + 1][t] = num
                    stop = false
                end
                if  t != 0 && board[s][t - 1] == "." && board[s][t - 1] != "#"
                    board[s][t - 1] = num
                    stop = false
                end
                if !(t == w - 1) && board[s][t + 1] == "." && board[s][t + 1] != "#"
                    board[s][t + 1] = num
                    stop = false
                end
            end
        end
    end
num += 1
count += 1
end

# board.each.with_index do |row, s|
#     row.each.with_index do |val, t|
#         if val.to_i > 0
#             board[s][t] = "*"
#         end
#     end
# end

board.each do |row|
    puts row.join
end