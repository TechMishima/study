# データ取得
N, R = gets.split.map(&:to_i)
board = N.times.map.with_index do |item, i|
    line = gets.split
    item = [line[0].to_i ,line[1].to_i , i]
end

# アルゴリズム
newNumber = N
board.each.with_index do |boardA, index1|
    board.each.with_index do |boardB, index2|
        if boardA[2] != boardB[2]
            # puts boardA[2].to_s + "の島と" + boardB[2].to_s + "の島"
            x = (boardA[0] - boardB[0]).abs
            y = (boardA[1] - boardB[1]).abs
            numberA = x ** 2 + y ** 2
            number = numberA ** 0.5
            if number <= 2 * R
                # puts boardA[2].to_s + "の島と" + boardB[2].to_s + "の島がくっついたよ"
                # board[index1][2] = newNumber
                # board[index2][2] = newNumber
                board.each.with_index do |boardc, index3|
                    if boardc[2] == board[index1][2]
                        board[index3][2] = newNumber
                    elsif boardc[2] == board[index2][2]
                        board[index3][2] = newNumber
                    end
                end
                newNumber += 1
            end
        end
    end
end

answers = []
newAnswers = []
board.each do |board|
    answers << board[2]
    newAnswers = answers.uniq
end
puts newAnswers.length