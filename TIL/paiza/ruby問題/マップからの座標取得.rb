# データの取得
line = gets.split(" "); H = line[0].to_i; W = line[1].to_i
map = []
H.times do
  line = gets
  map << line
end

# アルゴリズム
number = 0
map.each do |target|
    W.times do |i|
        if target[i] == "#"
            puts "#{number} #{i}"
        end
    end
number += 1
end