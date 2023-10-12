# データ取得
N = gets.to_i
counts = []
N.times do
    line = gets.split(" ")
    A = line[0].to_i ; B = line[1].to_i
    
    (A..B).each do |i|
        counts[i] = true
    end
end

# アルゴリズム
sum = 0
targets = []
counts.each do |count|
    if count == true
        sum += 1
        targets << sum
    else
        targets << sum
        sum = 0
    end
end

# 答えの出力
puts targets.max