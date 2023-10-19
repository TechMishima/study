# データ取得
line = gets.split(" "); X = line[0].to_i; Y = line[1].to_i; N = line[2].to_i

# クラス作成
# 東へ移動
def Higashi(steps, length, yoko, tate)
    if steps <= length
        yoko += steps
        puts "#{yoko} #{tate}"
    else
        yoko += length
        steps -= length
        Minami(steps, length, yoko, tate)
    end
end

# 南へ移動
def Minami(steps, length, yoko, tate)
    if steps <= length
        tate += steps
        puts "#{yoko} #{tate}"
    else
        tate += length
        steps -= length
        length += 1
        Nishi(steps, length, yoko, tate)
    end
end

# 西へ移動
def Nishi(steps, length, yoko, tate)
    if steps <= length
        yoko -= steps
        puts "#{yoko} #{tate}"
    else
        yoko -= length
        steps -= length
        Kita(steps, length, yoko, tate)
    end
end

# 北へ移動
def Kita(steps, length, yoko, tate)
    if steps <= length
        tate -= steps
        puts "#{yoko} #{tate}"
    else
        tate -= length
        steps -= length
        length += 1
        Higashi(steps, length, yoko, tate)
    end
end
# クラス作成終了

# アルゴリズム
yoko = X
tate = Y
steps = N
length = 1

Higashi(steps, length, yoko, tate)