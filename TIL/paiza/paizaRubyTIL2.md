# ToDo
```
h, w, sy, sx, n = gets.split.map(&:to_i)
board = h.times.map { gets.chomp.split('') }

move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
now = 0

y, x = sy, sx
n.times do
  d = gets.chomp
  if d == 'L'
    now -= 1
  else
    now += 1
  end

  ny = y + move[now % 4][0]
  nx = x + move[now % 4][1]
  if !(0 <= ny && ny <= h - 1 && 0 <= nx && nx <= w - 1 && board[ny][nx] != '#')
    puts 'Stop'
    break
  end

  y, x = ny, nx
  puts y.to_s + ' ' + x.to_s
end
```
上記のコードリーディング

# 参考URL
Ruby mapメソッドの基本の使い方<br>
https://zenn.dev/keyproducts/articles/e8e3c8aca68f3d


# TIL

## mapメソッドについて
### 配列での基本構文
```
# 基本構文
配列.map { |item| 実行する処理 }

# 省略形
配列.map(&:downcase)

# 実行する処理が複数行に渡る場合
配列.map do |item|
  実行する処理
end
```
### ハッシュでの基本構文
```
h = { BANANA: 100, ORANGE: 200, MELON: 300 }

h.map { |key, value| [key, value*2] }
=> [[:BANANA, 200], [:ORANGE, 400], [:MELON, 600]]

# 返り値をハッシュにしたい場合はto_hメソッドを使用する
h.map { |key, value| [key, value*2] }.to_h
=> {:BANANA=>200, :ORANGE=>400, :MELON=>600}
```

## 複数の変数定義
配列を使用した、変数定義
```
fruits = ["apple", "banana", "cherry"]
a, b, c = fruits
```
カンマで区切る、変数定義
```
a, b, c = "apple", "banana", "cherry"
```

## 文字列の分割 split
区切り文字（空白、タブ、改行）で文字列を分割する
```
# 例 Hello world
parts = text.split
```
連続する文字を分割する
```
# 例 hello
parts = text.split("")
```
## times.map
複数行の配列を配列に格納
```
board = h.times.map { gets.chomp.split("") }
```

# アルゴリズムを自分なりに読み解く
## フローチャート
- 1，2行目でデータを取得する。


## コード解読
### 1 ~ 2行目
```
h, w, sy, sx, n = gets.split.map(&:to_i)
board = h.times.map { gets.chomp.split("") }
```
getsメソッドで取得、to_iメソッドで数値に変換して、mapメソッドで配列にする。<br>
配列にしたのち、各変数を定義する。<br>
<br>
timesメソッドで複数回処理する。<br>
mapメソッドで配列にしたのち、boardに格納する。<br>
split("")を入力することで、連続する文字列に対しても、一文字ずつ分ける事ができる。
