h, w = gets.split.map(&:to_i)
board = h.times.map{ gets.chomp.split("") }
a, b = 0
board.each.with_index do |row, indexa|
    row.each.with_index do |square, indexb|
        if square == "*"
            a, b = indexa, indexb
        end
    end
end

board[a - 1][b] = "*" if a != 0 && board[a - 1][b] != "#"
board[a + 1][b] = "*" if a != h - 1 && board[a + 1][b] != "#"
board[a][b - 1] = "*" if b != 0 && board[a][b - 1] != "#"
board[a][b + 1] = "*" if !(b == w - 1) && board[a][b + 1] != "#"

board.each do |row|
    puts row.join
end