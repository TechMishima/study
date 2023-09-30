# データの取得
line = gets.split(" "); N = line[0].to_i; M = line[1].to_i

routes = []
N.times do
    routes << gets.split(" ")
end

X = gets.to_i

steps = []
X.times do
    line = gets.split(" ")
    step = {:num => line[0].to_i, :point => line[1].to_i}
    steps << step
end

# アルゴリズム
pointA = 0
sum = []
X.times do |i|
    step = steps[i]
    pointB = step[:point] - 1
    num = step[:num]
    route = routes[num - 1]
    
    pay = (route[pointB].to_i - route[pointA].to_i).abs
    sum << pay
    pointA = pointB
end

answer = 0
sum.each do |pay|
    answer += pay
end

puts answer