# データ取得
line = gets.split(" "); N = line[0].to_i; K = line[1].to_i

heros = []
N.times do
    line = gets.split(" ")
    hero = {level: line[0].to_i,
            health: line[1].to_i,
            attack: line[2].to_i,
            defense: line[3].to_i,
            speed: line[4].to_i,
            clever: line[5].to_i,
            fortune: line[6].to_i
            }
    heros << hero
end
# クラス作成
def levelup(heros, num, h, a, d, s, c, f)
    num = num.to_i
    heros[num - 1][:level] += 1
    heros[num - 1][:health] += h.to_i
    heros[num - 1][:attack] += a.to_i
    heros[num - 1][:defense] += d.to_i
    heros[num - 1][:speed] += s.to_i
    heros[num - 1][:clever] += c.to_i
    heros[num - 1][:fortune] += f.to_i
end

def muscle_training(heros, num, h, a)
    num = num.to_i
    heros[num - 1][:health] += h.to_i
    heros[num - 1][:attack] += a.to_i
end

def running(heros, num, d, s)
    num = num.to_i
    heros[num - 1][:defense] += d.to_i
    heros[num - 1][:speed] += s.to_i
end

def study(heros, num, c)
    num = num.to_i
    heros[num - 1][:clever] += c.to_i
end

def pray(heros, num, f)
    num = num.to_i
    heros[num - 1][:fortune] += f.to_i
end

# アルゴリズム
K.times do
    line = gets.split(" ")
    if line[1] == "levelup"
        levelup(heros ,line[0], line[2], line[3], line[4], line[5], line[6], line[7])
    elsif line[1] == "muscle_training"
        muscle_training(heros ,line[0], line[2], line[3])
    elsif line[1] == "running"
        running(heros ,line[0], line[2], line[3])
    elsif line[1] == "study"
        study(heros ,line[0], line[2])
    elsif line[1] == "pray"
        pray(heros ,line[0], line[2])
    end
end

# 出力
answer = []
heros.each do |hero|
    answer << ([hero[:level], hero[:health], hero[:attack],
               hero[:defense], hero[:speed], hero[:clever], hero[:fortune]]
               ).join(" ")
end
puts answer