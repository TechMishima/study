# ToDo
https://paiza.jp/works/mondai<br>
上記の「定番アルゴリズムの習得」を学ぶ<br>
の続き

# Progress
始まり

- 累積和メニュー

# TIL

## 累積和メニュー

### 区間の和 1

**累積和について**

>累積和は、一言でいうと「適切な前処理をおこない、配列上の区間の総和を高速で処理できるようにする手法」です。

**累積和の考え方**

>数列 a の累積の和をあらかじめ計算しておくことで、長い区間の和でも一回の計算で求めることができます。

(例)<br>
数列 a_0, a_1, ..., a_(N-1) に対して、数列 s_0, s_1, ... s_N を以下のように考えます。
```
s_0 = 0
s_1 = a_0
s_2 = a_0 + a_1
s_3 = a_0 + a_1 + a_2
...
s_N = a_0 + a_1 + ... + a_(N-1)
```
この数列 s を用いると、a_2 から a_7 までの和は s_8 - s_2 で求めることができます。

任意の区間([a,b])の和は下記の式で求められる。
$$ \sum_{k=a}^bA[k] = B[b] - B[a-1] $$
※上記式を使用するときはa=0の時がエラーの原因になるので対策をすること！

**開区間と閉区間**

閉区間とは、区間の端を含む区間のことで、[2, 7] のように表されます。
```
a_2, a_3, a_4, a_5, a_6, a_7
```

開区間とは、区間の端を含まない区間のことで、(2, 7) のように表されます。
```
a_3, a_4, a_5, a_6
```
---
以上を踏まえての自作コード
```
line = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]
=begin
10.times do |i|
    line << i+1
end
=end

sums = []
num = 0
line.each do |val|
    num += val
    sums << num
end

puts sums[7] - sums[1]
```

### 区間の和 2
自作コード
```
line = gets.split.map(&:to_i)

sums = []
num = 0
line.each do |val|
    num += val
    sums << num
end

puts sums[7] - sums[1]
```

### 区間の和 3
自作コード<br>
始まりが0の時だけ注意する
```
a, b = gets.split.map(&:to_i)
line = gets.split.map(&:to_i)

sums = []
num = 0
line.each do |val|
    num += val
    sums << num
end

if a != 0
    puts sums[b] - sums[a-1]
else
    puts sums[b]
end
```

### 区間の和 4
自作コード
```
n, a, b = gets.split.map(&:to_i)
line = gets.split.map(&:to_i)

sums = []
num = 0
line.each do |val|
    num += val
    sums << num
end

if a != 0
    puts sums[b] - sums[a-1]
else
    puts sums[b]
end
```

### 連続する N 個の和の最大値 1
自作コード
```
line = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]

cumSum = [0]
num = 0
line.each do |val|
    num += val
    cumSum << num
end

max = 0
for i in 0..7
    sum = cumSum[i+3] - cumSum[i]
    if sum > max
        max = sum
    end
end

puts max
```

### 連続する N 個の和の最大値 2
自作コード
```
line = gets.split.map(&:to_i)

cumSum = [0]
num = 0
line.each do |val|
    num += val
    cumSum << num
end

max = 0
for i in 0..7
    sum = cumSum[i+3] - cumSum[i]
    if sum > max
        max = sum
    end
end

puts max
```

### 連続する N 個の和の最大値 3
自作コード
```
n = gets.to_i
line = gets.split.map(&:to_i)

cumSum = [0]
num = 0
line.each do |val|
    num += val
    cumSum << num
end

max = 0
for i in 0..(n-3)
    sum = cumSum[i+3] - cumSum[i]
    if sum > max
        max = sum
    end
end

puts max
```

### 【連続する N 個の和の最大値】 連続する N 個の和の最大値 4 
自作コード
```
n, k = gets.split.map(&:to_i)
line = gets.split.map(&:to_i)

cumSum = [0]
num = 0
line.each do |val|
    num += val
    cumSum << num
end

max = 0
for i in 0..(n-k)
    sum = cumSum[i+k] - cumSum[i]
    if sum > max
        max = sum
    end
end

puts max
```

### 区間内の個数 1
自作コード
```
line = [1, 5, 9, 7, 5, 3, 2, 5, 8, 4]

evenCounts = [0]
num = 0
line.each do |val|
    num += 1 if val % 2 == 0
    evenCounts << num
end

puts evenCounts[8] - evenCounts[2]
```

### 区間内の個数 2
自作コード
```
line = gets.split.map(&:to_i)

evenCounts = [0]
num = 0
line.each do |val|
    num += 1 if val % 2 == 0
    evenCounts << num
end
puts evenCounts[8] - evenCounts[2]
```

### 区間内の個数 3
自作コード
```
a, b = gets.split.map(&:to_i)
line = gets.split.map(&:to_i)

evenCounts = [0]
num = 0
line.each do |val|
    num += 1 if val % 2 == 0
    evenCounts << num
end
puts evenCounts[b+1] - evenCounts[a]
```

### 【区間内の個数】区間内の個数 4
自作コード
```
n, a, b = gets.split.map(&:to_i)
line = gets.split.map(&:to_i)

evenCounts = [0]
num = 0
line.each do |val|
    num += 1 if val % 2 == 0
    evenCounts << num
end
puts evenCounts[b+1] - evenCounts[a]
```

### 区間内の個数 (文字列) 1
自作コード
```
str = "bwwbwbbwbwbb"
line = str.chomp.split("")

bCounts = [0]
num = 0
line.each do |val|
    num += 1 if val == "b"
    bCounts << num
end

puts bCounts[8] - bCounts[1]
```

### 区間内の個数 (文字列) 2
自作コード
```
line = gets.chomp.split("")

bCounts = [0]
num = 0
line.each do |val|
    num += 1 if val == "b"
    bCounts << num
end

puts bCounts[8] - bCounts[1]
```

### 区間内の個数 (文字列) 3
自作コード
```
a, b = gets.split.map(&:to_i)
line = gets.chomp.split("")

bCounts = [0]
num = 0
line.each do |val|
    num += 1 if val == "b"
    bCounts << num
end

puts bCounts[b] - bCounts[a-1]
```

### 【区間内の個数 (文字列) 】 区間内の個数 (文字列) 4
自作コード
```
n, a, b = gets.split.map(&:to_i)
line = gets.chomp.split("")

bCounts = [0]
num = 0
line.each do |val|
    num += 1 if val == "b"
    bCounts << num
end

puts bCounts[b] - bCounts[a-1]
```

### 二次元累積和 1

**2次元累積和の考え方**

下記の二次元配列AをA_{i, j} (0 ≦ i ≦ 4, 0 ≦ j ≦ 4)としたとき、<br>
左上の要素をA_{1, 1}, 右下の要素を A_{3, 3} としたとき、この長方形領域内の整数の和を累積和を用いて求める。
> 1 2 3 4 5<br>
  2 3 4 5 6<br>
  3 4 5 6 7<br>
  4 5 6 7 8<br>
  5 6 7 8 9

A_{1, 1}, 右下の要素を A_{3, 3} としたときの長方形領域は下記になる。
> 3 4 5<br>
  4 5 6<br>
  5 6 7<br>

どのように解いていくのかステップごとに分けてまとめる。<br>
1. A_{3, 3}までの範囲を足し合わせる。
> 1 2 3 4 ~~5~~<br>
  2 3 4 5 ~~6~~<br>
  3 4 5 6 ~~7~~<br>
  4 5 6 7 ~~8~~<br>
  ~~5 6 7 8 9~~
$$ (1+2+3+4)+(2+3+4+5)+(3+4+5+6)+(4+5+6+7)=64 $$

2. 答えの左側の範囲外A_{0, 3}までの範囲を引き算する。
> 1 ~~2 3 4 5~~<br>
  2 ~~3 4 5 6~~<br>
  3 ~~4 5 6 7~~<br>
  4 ~~5 6 7 8~~<br>
  ~~5 6 7 8 9~~
$$ 64 - (1+2+3+4) = 54 $$

3. 答えの上側の範囲外A_{3, 0}までの範囲を引き算する。
> 1 2 3 4 ~~5~~<br>
  ~~2 3 4 5 6~~<br>
  ~~3 4 5 6 7~~<br>
  ~~4 5 6 7 8~~<br>
  ~~5 6 7 8 9~~
$$ 54 - (1+2+3+4) = 44 $$

4. 引き算で重複した範囲A_{0, 0}を足す。答えになる。
> 1 ~~2 3 4 5~~<br>
  ~~2 3 4 5 6~~<br>
  ~~3 4 5 6 7~~<br>
  ~~4 5 6 7 8~~<br>
  ~~5 6 7 8 9~~
$$ 44 + 1 = 45 $$

上記のｽﾃｯﾌﾟをまとめると下記の公式になる。

>2次元配列Aの長方形領域(左上がA{a, b},右下がA{i, j})の整数の和
$$ (長方形領域内の整数の和) = A_{i, j} - A_{(a-1), j} - A_{i, (b-1)} + A_{(a-1), (b-1)} $$


自作コード
```
matrix = [[0, 0, 0, 0, 0, 0],
        [0, 1, 2, 3, 4, 5],
        [0, 2, 3, 4, 5, 6],
        [0, 3, 4, 5, 6, 7],
        [0, 4, 5, 6, 7, 8],
        [0, 5, 6, 7, 8, 9]]