# ToDo
Aランクアップ陣取りゲーム
https://paiza.jp/works/mondai/a_rank_level_up_problems/a_rank_camp_boss<br>
下記コードの解読

```
h, w = gets.split.map(&:to_i)
n = gets.chomp
board = h.times.map { gets.chomp.split('') }

names = ['A'.to_sym, 'B'.to_sym]
players = { A: [[0, 0]], B: [[0, 0]] }

board.each.with_index do |row, y|
  row.each.with_index do |val, x|
    next if val == '#' || val == '.'

    sym = val.to_sym
    players[sym][0] = [y, x]
    board[y][x] = sym
  end
end

move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
turn = names.index(n.to_sym)
while !players[:A].empty? || !players[:B].empty?
  name = names[turn % 2]
  players[name].length.times do
    y, x = players[name].shift

    move.each do |t, s|
      ny = y + t
      nx = x + s

      if 0 <= ny && ny <= h - 1 && 0 <= nx && nx <= w - 1 &&
           board[ny][nx] == '.'
        players[name].push [ny, nx]
        board[ny][nx] = name
      end
    end
  end

  turn += 1
end

teri = { A: 0, B: 0 }
board.each do |row|
  row.each do |val|
    next if val == '#' || val == '.'
    teri[val] += 1
  end
end

puts teri[:A].to_s + ' ' + teri[:B].to_s
puts teri.max_by { |key, val| val }[0]
```
# アルゴリズム解読
## 1~3行目
```
h, w = gets.split.map(&:to_i)
n = gets.chomp
board = h.times.map { gets.chomp.split('') }
```
データの取得を行う

## 4~5行目
```
names = ['A'.to_sym, 'B'.to_sym]
players = { A: [[0, 0]], B: [[0, 0]] }
```