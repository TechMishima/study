# データ取得
line = gets.split(" "); L = line[0].to_i; N = line[1].to_i; M = line[2].to_i
lane = []
(L - 1).times do
    lines = {customer: false, sushi: false ,time: 0,switch: "off"}
    lane << lines
end
#lane = Array.new(L - 1) { { customer: false, sushi: false ,time: 0,switch: "off"} }
# 客の位置
line = gets.split(" ");
N.times do |i|
    lane[line[i].to_i][:customer] = true
end
#寿司の位置
line = gets.split(" ");
M.times do |i|
    lane[line[i].to_i][:sushi] = true
end

puts lane

# アルゴリズム
Answer = 0
while (M > 0) do
    # 寿司食べる
    (L - 1).times do |i|
        if lane[i][:customer] == true && lane[i][:sushi] == true && lane[i][:time] == 0
             lane[i][:sushi] = false
             lane[i][:time] = 11
             M -= 1
        end
    end
    
    # 寿司流れる
    (L - 1).times do |i|
        if i == L - 2 && lane[0][:sushi] == true
            lane[L - 2][:switch] = "on"
            lane[0][:sushi] = false
        elsif lane[i - 1][:sushi] == true
            lane[i][:switch] = "on"
            lane[i - 1][:sushi] = false
        end
    end
    (L - 1).times do |i|
        if lane[i][:switch] == "on"
            lane[i][:sushi] = true
            lane[i][:switch] = "off"
        end
    end
        
    
    # お腹がすく
    (L - 1).times do |i|
        if lane[i][:time] != 0
            lane[i][:time] -= 1
        end
    end
Answer += 1
end
puts Answer + 10