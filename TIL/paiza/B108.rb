# データ取得
line =gets.split(" "); N = line[0].to_i; M = line[1].to_i

gondolas = []
N.times do |i|
    line = gets.to_i
    gondola = {num: i + 1, max: line, menbers: 0}
    gondolas << gondola
end

menbers = []
M.times do
    line = gets.to_i
    menbers << line
end

# アルゴリズム
num = 0
menbers.each do |menber|
    while menber > 0 do
        if menber > gondolas[num][:max]
            gondolas[num][:menbers] += gondolas[num][:max]
            menber -= gondolas[num][:max]
            if num == N - 1
                num = 0
            else
                num += 1
            end
        elsif menber <= gondolas[num][:max]
            gondolas[num][:menbers] += menber
            menber -= menber
            if num == N - 1
                num = 0
            else
                num += 1
            end
        end
    end
end

# 答えの出力
gondolas.each do |gondola|
    puts gondola[:menbers]
end