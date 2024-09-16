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