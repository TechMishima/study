line = gets.split(" "); N = line[0].to_i; K = line[1].to_i; S = line[2].to_i

steps = []
N.times do |i|
    line = gets.split(" ")
    step = {:step => line[0], :left => line[1].to_i, :right => line[2].to_i}
    steps << step
end

point = S - 1

routes = []
(K + 1).times do
    routes << steps[point][:step]

    switch = gets.to_i
    
    if switch == 1
        point = steps[point][:left].to_i - 1
    elsif switch == 2
        point = steps[point][:right].to_i - 1
    end
    
end

puts routes.join