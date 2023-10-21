# データ取得
line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
map = []
H.times do
    line = gets.split("")
    map << line.slice(0,W)
end

# アルゴリズム
counts = 0
(H - 2).times do |y|
    (W - 2).times do |x|
        if map[y + 1][x + 1] == "."
            # puts "真ん中は点"
            if map[y][x] == "#" && map[y][x + 1] == "#" && map[y][x + 2] == "#"
                # puts "上が#"
                if  map[y + 1][x] == "#" && map[y + 1][x + 2] == "#"
                    # puts "横が#"
                    if map[y + 2][x] == "#" && map[y + 2][x + 1] == "#" && map[y + 2][x + 2] == "#"
                        # puts "下が#"
                        counts += 1
                    end
                end
            end
        end
    end
end
puts counts