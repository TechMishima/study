# データ取得
line = gets.split(" "); H = line[0].to_i; W = line[1].to_i; sy = line[2].to_i; sx = line[3].to_i; N = line[4].to_i
map = []
H.times do
    line = gets.chomp
    map << line
end
move = []
N.times do
    line = gets.chomp
    move << line
end

# アルゴリズム
d = "N"
move.each do |move|
    # 北向き
    if d == "N"
        if move == "L"
            # puts "北向きL"
            if map[sy][sx - 1] == "#"
                puts "Stop"
                break
            else
                sx -= 1
                puts "#{sy} #{sx}"
            end
            d = "W"
        elsif move == "R"
            # puts "北向きR"
            if map[sy][sx + 1] == "#"
                puts "Stop"
                break
            else
                sx += 1
                puts "#{sy} #{sx}"
            end
            d = "E"
        end
    # 南向き
    elsif d == "S"
        if move == "L"
            # puts "南向きL"
            if map[sy][sx + 1] == "#"
                puts "Stop"
                break
            else
                sx += 1
                puts "#{sy} #{sx}"
            end
            d = "E"
        elsif move == "R"
            # puts "南向きR"
            if map[sy][sx - 1] == "#"
                puts "Stop"
                break
            else
                sx -= 1
                puts "#{sy} #{sx}"
            end
            d = "W"
        end
    # 東向き
    elsif d == "E"
        if move == "L"
            # puts "東向きL"
            if map[sy - 1][sx] == "#"
                puts "Stop"
                break
            else
                sy -= 1
                puts "#{sy} #{sx}"
            end
            d = "N"
        elsif move == "R"
            # puts "東向きR"
            if map[sy + 1][sx] == "#"
                puts "Stop"
                break
            else
                sy += 1
                puts "#{sy} #{sx}"
            end
            d = "S"
        end
    # 西向き
    elsif d == "W"
        if move == "L"
            # puts "西向きL"
            if map[sy + 1][sx] == "#"
                puts "Stop"
                break
            else
                sy += 1
                puts "#{sy} #{sx}"
            end
            d = "S"
        elsif move == "R"
            # puts "西向きR"
            if map[sy - 1][sx] == "#"
                puts "Stop"
                break
            else
                sy -= 1
                puts "#{sy} #{sx}"
            end
            d = "N"
        end
    end
end

##############模範回答################
h, w, sy, sx, n = gets.split.map(&:to_i)
board = h.times.map { gets.chomp.split('') }

move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
now = 0

y, x = sy, sx
n.times do
  d = gets.chomp
  if d == 'L'
    now -= 1
  else
    now += 1
  end

  ny = y + move[now % 4][0]
  nx = x + move[now % 4][1]
  if !(0 <= ny && ny <= h - 1 && 0 <= nx && nx <= w - 1 && board[ny][nx] != '#')
    puts 'Stop'
    break
  end

  y, x = ny, nx
  puts y.to_s + ' ' + x.to_s
end