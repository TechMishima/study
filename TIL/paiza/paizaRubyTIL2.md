# 移動の制御 (move配列とnow変数の役割)

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

## 負の値の剰余について
```
irb(main):001:0> -1 % 4
=> 3
irb(main):002:0> -2 % 4
=> 2
irb(main):003:0> -3 % 4
=> 1
irb(main):004:0> -4 % 4
=> 0
```

# アルゴリズムを自分なりに読み解く
## フローチャート
- 標準入力からデータを取得する。
- 向きを考慮する移動を行う為、move配列とnow変数を定義する。
- 標準入力から方向"L","R"を受け取りnow変数を変化させて、移動を制御する。
- 進んだ先がボードの外、障害物"#"だった場合、Stopを出力してbreakさせる。
- 上記に当てはまらない場合は、進んだ先の位置を出力する。


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

### 3 ~ 4行目
```
move = [[-1, 0], [0, 1], [1, 0], [0, -1]]
now = 0
```
move配列で移動を管理する。<br>
インデックスが0だと、[-1, 0]になるのでyがマイナス１・・・つまり北に1移動することになる。<br>
move配列をまとめると
- インデックス0 ・・・ [-1, 0] ・・・ 北に1移動する。
- インデックス1 ・・・ [0, 1] ・・・ 東に1移動する。
- インデックス2 ・・・ [1, 0] ・・・ 南に1移動する。
- インデックス3 ・・・ [0, -1] ・・・ 西に1移動する。
<br>になる。<br>
<br>

nowを定義する理由については、今回は向きを考慮する移動であるから。<br>
now = 0の時は北を向いている。<br>
アルゴリズムの時にnowが重要になってくる。

### 5 ~ 12行目
```
y, x = sy, sx
n.times do
  d = gets.chomp
  if d == 'L'
    now -= 1
  else
    now += 1
  end
```
y,x = sy,sxで初期位置を変数に入れる。<br>
timesメソッドで移動を始める。<br>

getsメソッドで左右方向を標準入力から受け取って、変数dに定義する。<br>
(下記は13~18行目に関係している)<br>
ここで左Lを受け取った際、nowを-1で減らすことにより、インデックスがずれてインデックス3の西向きに移動になる。<br>
逆にnowが1増えると、インデックスがずれてインデックス1の東向きに移動になる。

### 13 ~ 18行目
```
  ny = y + move[now % 4][0]
  nx = x + move[now % 4][1]
  if !(0 <= ny && ny <= h - 1 && 0 <= nx && nx <= w - 1 && board[ny][nx] != '#')
    puts 'Stop'
    break
  end
```

ny,nxは移動した後のマスの位置になる。<br>
moveの引数の[now % 4]について、nowがマイナスになってもインデックスはちゃんと対応している。（上記、負の値の剰余について）<br>
if文について、①ボードの範囲に入っている ②お邪魔ブロック"#"でないこと<br>
に当てはまっていない場合、puts "Stop"を出力して、breakする。

### 19 ~ 21行目
```
y, x = ny, nx
  puts y.to_s + ' ' + x.to_s
end
```
障害物、壁にぶつからなかった場合は、進んだ先の位置を出力する。<br>
繰り返し処理を行う。