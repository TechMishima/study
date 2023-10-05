# データ取得
line = gets.split(" ");N = line[0].to_i; K = line[1].to_i

cars = []
N.times do |i|
    line = gets.split(" ")
    car = {num: i + 1, kind: line[0], litre: line[1].to_i, fuel: line[2].to_i, length: 0}
    cars << car
end

# クラス作成
def run(cars, number)
    if cars[number - 1][:litre] >= 1
        num = number - 1
        cars[num][:litre] -= 1
        cars[num][:length] += cars[num][:fuel]
    end
end

def fly(cars, number)
    if cars[number - 1][:litre] >= 5 && cars[number - 1][:kind] == "supersupersupercar"
        num = number - 1
        cars[num][:litre] -= 5
        cars[num][:length] += 2 * (cars[num][:fuel] ** 2)
    elsif cars[number - 1][:litre] >= 5
        num = number - 1
        cars[num][:litre] -= 5
        cars[num][:length] += cars[num][:fuel] ** 2
    else
        run(cars, number)
    end
end

def teleport(cars, number)
    if cars[number - 1][:litre] >= cars[number - 1][:fuel] ** 2
        num = number - 1
        cars[num][:litre] -= cars[number - 1][:fuel] ** 2
        cars[num][:length] += cars[num][:fuel] ** 4
    else
        fly(cars, number)
    end
end

# アルゴリズム
K.times do
    line = gets.split(" ")
    if line[1] == "run"
        run(cars, line[0].to_i)
    elsif line[1] == "fly"
        fly(cars, line[0].to_i)
    elsif line[1] == "teleport"
        teleport(cars, line[0].to_i)
    end
end

# 答えの出力
cars.each do |car|
    puts car[:length]
end