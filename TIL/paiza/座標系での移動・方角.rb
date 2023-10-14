# データの取得
line = gets.split(" "); Y = line[0].to_i; X = line[1].to_i; N = line[2].to_i

# アルゴリズム
tate = Y
yoko = X
N.times do
    line = gets.chomp
    if line == "S"
        tate += 1
    elsif line == "N"
        tate -= 1
    elsif line == "W"
        yoko -= 1
    elsif line == "E"
        yoko += 1
    end
    puts "#{tate} #{yoko}"
end