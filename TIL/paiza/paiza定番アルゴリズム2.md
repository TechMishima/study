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
matrix = [[1, 2, 3, 4, 5],
        [2, 3, 4, 5, 6],
        [3, 4, 5, 6, 7],
        [4, 5, 6, 7, 8],
        [5, 6, 7, 8, 9]]
        
min_x, min_y = 1, 1
max_x, max_y = 3, 3

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

a1 = sum_matrix[max_y+1][max_x+1]
a2 = sum_matrix[min_y][max_x+1]
a3 = sum_matrix[max_y+1][min_x]
a4 = sum_matrix[min_y][min_x]

puts a1 - a2 - a3 + a4
```

### 二次元累積和 2

自作コード
```
matrix = []
5.times do
    hoge = gets.split.map(&:to_i)
    matrix << hoge
end
        
min_x, min_y = 1, 1
max_x, max_y = 3, 3

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

a1 = sum_matrix[max_y+1][max_x+1]
a2 = sum_matrix[min_y][max_x+1]
a3 = sum_matrix[max_y+1][min_x]
a4 = sum_matrix[min_y][min_x]

puts a1 - a2 - a3 + a4
```

### 二次元累積和 3

自作コード
```
a, b = gets.split.map(&:to_i)
matrix = []
5.times do
    hoge = gets.split.map(&:to_i)
    matrix << hoge
end
        
min_x, min_y = 3, a
max_x, max_y = 3, b

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

a1 = sum_matrix[max_y+1][max_x+1]
a2 = sum_matrix[min_y][max_x+1]
a3 = sum_matrix[max_y+1][min_x]
a4 = sum_matrix[min_y][min_x]

puts a1 - a2 - a3 + a4
```

### 二次元累積和 4

自作コード
```
a, b, c, d = gets.split.map(&:to_i)
matrix = []
5.times do
    hoge = gets.split.map(&:to_i)
    matrix << hoge
end
        
min_x, min_y = b, a
max_x, max_y = d, c

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

a1 = sum_matrix[max_y+1][max_x+1]
a2 = sum_matrix[min_y][max_x+1]
a3 = sum_matrix[max_y+1][min_x]
a4 = sum_matrix[min_y][min_x]

puts a1 - a2 - a3 + a4
```

### 二次元累積和 5

自作コード
```
n = gets.to_i
a, b, c, d = gets.split.map(&:to_i)
matrix = []
n.times do
    hoge = gets.split.map(&:to_i)
    matrix << hoge
end
        
min_x, min_y = b, a
max_x, max_y = d, c

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

a1 = sum_matrix[max_y+1][max_x+1]
a2 = sum_matrix[min_y][max_x+1]
a3 = sum_matrix[max_y+1][min_x]
a4 = sum_matrix[min_y][min_x]

puts a1 - a2 - a3 + a4
```

### 【二次元累積和】 二次元累積和 6

自作コード
```
n, m = gets.split.map(&:to_i)
a, b, c, d = gets.split.map(&:to_i)
matrix = []
n.times do
    hoge = gets.split.map(&:to_i)
    matrix << hoge
end
        
min_x, min_y = b, a
max_x, max_y = d, c

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

a1 = sum_matrix[max_y+1][max_x+1]
a2 = sum_matrix[min_y][max_x+1]
a3 = sum_matrix[max_y+1][min_x]
a4 = sum_matrix[min_y][min_x]

puts a1 - a2 - a3 + a4
```

### 【二次元累積和】 二次元累積和 7

自作コード
```
n, m, q= gets.split.map(&:to_i)
matrix = []
n.times do
    hoge = gets.split.map(&:to_i)
    matrix << hoge
end

hoge = []
(matrix[0].length+1).times do
    hoge << 0
end

# 横足し算
sum_matrix = [hoge]
matrix.each do |line|
    hoge = [0]
    num = 0
    line.each do |val|
        num += val
        hoge << num
    end
    sum_matrix << hoge
end

# 縦足し算
(sum_matrix[0].length).times do |s|
    num = 0
    (sum_matrix.length).times do |t|
        num += sum_matrix[t][s]
        sum_matrix[t][s] = num
    end
end

q.times do
    a, b, c, d = gets.split.map(&:to_i)
    min_x, min_y = b, a
    max_x, max_y = d, c

    a1 = sum_matrix[max_y+1][max_x+1]
    a2 = sum_matrix[min_y][max_x+1]
    a3 = sum_matrix[max_y+1][min_x]
    a4 = sum_matrix[min_y][min_x]

    puts a1 - a2 - a3 + a4
end
```

AIコード
```
n, m, q = gets.split.map(&:to_i)
matrix = Array.new(n) { gets.split.map(&:to_i) }
sum_matrix = Array.new(n + 1) { Array.new(m + 1, 0) }

(0...n).each do |i|
  (0...m).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + matrix[i][j]
  end
end

q.times do
  a, b, c, d = gets.split.map(&:to_i)
  puts sum_matrix[c + 1][d + 1] - sum_matrix[a][d + 1] - sum_matrix[c + 1][b] + sum_matrix[a][b]
end
```
上記のコードはすっきりしていて見やすい。<br>
縦の計算と横の計算を同時にしているのですっきりとして見える。

### 1 次元上のいもす法 1

**いもす法のメリット**

>区間の値を何度も更新し、最後にそれぞれの値を得たい場合に有効である。<br>
先に区間の入口と出口のみに加算と減算をおこなったあと累積和をとることで最後にまとめて全体の任意の値を求めることができる。

**いもす法とは？**

問題
> 横に並んだ 10 個のマスがあり、最初、マスには全て 0 が書かれています。<br>
以下の 3 つの範囲が与えられます。それぞれの範囲に対して、その範囲に含まれるマスに 1 を加算していきます。<br>
すべての加算が終わった時点での 10 個のマスに書かれた値のうち、最大の値をいもす法を用いて求めてください。

>1 マス目から 6 マス目<br>
3 マス目から 9 マス目<br>
4 マス目から 5 マス目<br>

解き方

1. 10 個のマスは全て 0
```
0 0 0 0 0 0 0 0 0 0
```

2. 「1 マス目から 6 マス目」を考える。<br>
1マス目に1を加算、7マス目を1を減算する。
```
1 0 0 0 0 0 -1 0 0 0
```

3. 2つ目の範囲、3つ目の範囲を同様に行う。
```
1 0 1 1 0 -1 -1 0 0 -1
```

4. 上記に対して累積和を行う。
```
1 1 2 3 3 2 1 1 1 0
```

よって、最大値は3になる。

---

自作コード
```
=begin
1 マス目から 3 マス目
1 マス目から 8 マス目
3 マス目から 8 マス目
3 マス目から 6 マス目
7 マス目から 9 マス目
=end

imos_array = Array.new(10) { 0 }
line = [[1, 3], [1, 8], [3, 8], [3, 6], [7, 9]]
line.each do |val|
    imos_array[val[0]-1] += 1
    imos_array[val[1]] -= 1
end

num = 0
imos_array.each.with_index do |val, i|
    num += val
    imos_array[i] = num
end

puts imos_array.max
```

### 1 次元上のいもす法 2

自作コード
```
imos_array = Array.new(10) { 0 }
line = Array.new(5) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[0]-1] += 1
    imos_array[val[1]] -= 1
end

num = 0
imos_array.each.with_index do |val, i|
    num += val
    imos_array[i] = num
end

puts imos_array.max
```

### 1 次元上のいもす法 3

自作コード
```
n = gets.to_i
imos_array = Array.new(10) { 0 }
line = Array.new(n) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[0]-1] += 1
    imos_array[val[1]] -= 1
end

num = 0
imos_array.each.with_index do |val, i|
    num += val
    imos_array[i] = num
end

puts imos_array.max
```

### 【1 次元上のいもす法】1 次元上のいもす法 4

自作コード
```
n, q = gets.split.map(&:to_i)
imos_array = Array.new(n + 1, 0)
line = Array.new(q) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[0] - 1] += 1
    imos_array[val[1]] -= 1
end

num = 0
imos_array.each.with_index do |val, i|
    num += val
    imos_array[i] = num
end

puts imos_array.max
```

### 2 次元上のいもす法 1

**2次元いもす法**

>考え方としては、1次元いもす法と同じ<br>
2次元累積和と同様に計算

**2次元いもす法の考え方**

問題
> 横縦5マスの範囲について 以下の 2 つの範囲にそれぞれ 1 を加算したときの最大値を求める。

>(1, 1) (4, 4)<br>
(2, 2) (5, 5)

解き方

1. 全てのマス(6マス)は全て 0
```
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
```

2. 「(1, 1) (4, 4)」を考える。<br>
(1, 1),(5, 5)に1を加算、(1, 5),(5, 1)に1を減算する。
```
1 0 0 0 -1 0
0 0 0 0 0 0
0 0 0 0 0 0
0 0 0 0 0 0
-1 0 0 0 1 0
0 0 0 0 0 0
```

3. 2つ目の範囲((2, 2) (5, 5))も同様に行う。
```
1 0 0 0 -1 0
0 1 0 0 0 -1
0 0 0 0 0 0
0 0 0 0 0 0
-1 0 0 0 1 0
0 -1 0 0 0 1
```

4. 上記に対して累積和を行う。
```
1 1 1 1 0 0
1 2 2 2 1 0
1 2 2 2 1 0
1 2 2 2 1 0
0 1 1 1 1 0
0 0 0 0 0 0
```

よって、最大値は2になる。

---

自作コード
```
=begin
(1, 1) (3, 3)
(2, 2) (4, 4)
(3, 3) (5, 5)
(1, 3) (3, 5)
(3, 1) (5, 3)
=end

q = 5
n = 5
imos_array = Array.new(n + 1) { Array.new(n + 1, 0) }
# line = Array.new(q) { gets.split.map(&:to_i) }
line = [[1, 1, 3, 3], [2, 2, 4, 4], [3, 3, 5, 5], [1, 3, 3, 5], [3, 1, 5, 3]]
line.each do |val|
    imos_array[val[1] - 1][val[0] - 1] += 1 # 左上
    imos_array[val[3]][val[0] - 1] -= 1 # 左下
    imos_array[val[1] - 1][val[2]] -= 1 # 右上
    imos_array[val[3]][val[2]] += 1 # 右下
end

sum_matrix = Array.new(n + 2) { Array.new(n + 2, 0) }
(0...n+1).each do |i|
  (0...n+1).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + imos_array[i][j]
  end
end

num = 0
sum_matrix.each do |line|
    line.each do |val|
        num = val if val > num
    end
end

puts num
```

### 2 次元上のいもす法 2

自作コード
```
q = 5
n = 5
imos_array = Array.new(n + 1) { Array.new(n + 1, 0) }
line = Array.new(q) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[2][val[0] - 1] += 1 # 左上
    imos_array[3][val[0] - 1] -= 1 # 左下
    imos_array[2][val[1]] -= 1 # 右上
    imos_array[3][val[1]] += 1 # 右下
end

sum_matrix = Array.new(n + 2) { Array.new(n + 2, 0) }
(0...n+1).each do |i|
  (0...n+1).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + imos_array[i][j]
  end
end

num = 0
sum_matrix.each do |line|
    line.each do |val|
        num = val if val > num
    end
end

puts num
```

### 2 次元上のいもす法 3

自作コード
```
q = 5
n = 5
imos_array = Array.new(n + 1) { Array.new(n + 1, 0) }
line = Array.new(q) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[1] - 1][val[0] - 1] += 1 # 左上
    imos_array[val[3]][val[0] - 1] -= 1 # 左下
    imos_array[val[1] - 1][val[2]] -= 1 # 右上
    imos_array[val[3]][val[2]] += 1 # 右下
end

sum_matrix = Array.new(n + 2) { Array.new(n + 2, 0) }
(0...n+1).each do |i|
  (0...n+1).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + imos_array[i][j]
  end
end

num = 0
sum_matrix.each do |line|
    line.each do |val|
        num = val if val > num
    end
end

puts num
```

### 2 次元上のいもす法 4

自作コード
```
q = gets.to_i
n = 5
imos_array = Array.new(n + 1) { Array.new(n + 1, 0) }
line = Array.new(q) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[1] - 1][val[0] - 1] += 1 # 左上
    imos_array[val[3]][val[0] - 1] -= 1 # 左下
    imos_array[val[1] - 1][val[2]] -= 1 # 右上
    imos_array[val[3]][val[2]] += 1 # 右下
end

sum_matrix = Array.new(n + 2) { Array.new(n + 2, 0) }
(0...n+1).each do |i|
  (0...n+1).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + imos_array[i][j]
  end
end

num = 0
sum_matrix.each do |line|
    line.each do |val|
        num = val if val > num
    end
end

puts num
```

### 2 次元上のいもす法 5

自作コード
```
n, k = gets.split.map(&:to_i)
imos_array = Array.new(n + 1) { Array.new(n + 1, 0) }
line = Array.new(k) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[1] - 1][val[0] - 1] += 1 # 左上
    imos_array[val[3]][val[0] - 1] -= 1 # 左下
    imos_array[val[1] - 1][val[2]] -= 1 # 右上
    imos_array[val[3]][val[2]] += 1 # 右下
end

sum_matrix = Array.new(n + 2) { Array.new(n + 2, 0) }
(0...n+1).each do |i|
  (0...n+1).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + imos_array[i][j]
  end
end

num = 0
sum_matrix.each do |line|
    line.each do |val|
        num = val if val > num
    end
end

puts num
```

### 【2 次元上のいもす法】 2 次元上のいもす法 6

自作コード
```
n, m, k = gets.split.map(&:to_i)
imos_array = Array.new(n + 1) { Array.new(m + 1, 0) }
line = Array.new(k) { gets.split.map(&:to_i) }
line.each do |val|
    imos_array[val[1] - 1][val[0] - 1] += 1 # 左上
    imos_array[val[3]][val[0] - 1] -= 1 # 左下
    imos_array[val[1] - 1][val[2]] -= 1 # 右上
    imos_array[val[3]][val[2]] += 1 # 右下
end

sum_matrix = Array.new(n + 2) { Array.new(m + 2, 0) }
(0...n+1).each do |i|
  (0...m+1).each do |j|
    sum_matrix[i + 1][j + 1] = sum_matrix[i + 1][j] + sum_matrix[i][j + 1] - sum_matrix[i][j] + imos_array[i][j]
  end
end

num = 0
sum_matrix.each do |line|
    line.each do |val|
        num = val if val > num
    end
end

puts num
```

AI
```
n, m, k = gets.split.map(&:to_i)
imos_array = Array.new(n + 1) { Array.new(m + 1, 0) }

k.times do
  a, b, c, d = gets.split.map(&:to_i)
  imos_array[b - 1][a - 1] += 1
  imos_array[d][c] += 1
  imos_array[b - 1][c] -= 1
  imos_array[d][a - 1] -= 1
end

(0..n).each do |i|
  (0...m).each do |j|
    imos_array[i][j + 1] += imos_array[i][j]
  end
end

(0...n).each do |i|
  (0..m).each do |j|
    imos_array[i + 1][j] += imos_array[i][j]
  end
end

max_value = 0

imos_array.each do |line|
  max_value = [max_value, line.max].max
end

puts max_value
```

一気に足し合わせるのではなく、縦横と計算を分けている。<br>
わかりやすいが自作コードの方が記述量は少なくなっている。でも可読性に欠けているかも

### 区間の数え上げ 1

**しゃくとり法とは**

>累積和と似たアルゴリズムである。<br>
しゃくとり法を用いることで、条件を満たす区間の数や、最も長い区間の長さを求めることができる。<br>
区間の左端と右端が交互に動いていくことから、しゃくとり虫に似ていることから命名された。

**しゃくとり法のルール**
1. left を固定し、条件を満たす間 right を 1 ずつ進めていき、right がそれ以上進めなくなったとき、<br>
   right - left とすることでそれまでの条件を満たす区間の数を求めることができる<br>
2. right がこれ以上右に進めなくなったとき、left を 1 進め、また ① に戻る
3. ただし、left == right となったときは、right を 1 進める

**しゃくとり法の考え方**

問題
>以下の 10 個の整数からなる数列が与えられます。<br>
1 5 9 1 20 5 3 6 5 4<br>
この数列において、長さが 1 以上で総和が 15 以下の区間がいくつあるか求めてください。

1. left を固定し、条件を満たす間 right を 1 ずつ進めていき、right がそれ以上進めなくなったとき<br>
right - left とすることでそれまでの条件を満たす区間の数を求めることができる

```
1 5 9 1 20 5 3 6 5 4
↑   ↑

1～3区間までになる。4区間になると16になり15以下ではないのでstep2に移る。
```
2. right がこれ以上右に進めなくなったとき、left を 1 進め、また ① に戻る<br>
この時にsumにrightを足しておく。今回は3

```
1 5 9 1 20 5 3 6 5 4
  ↑ ↑
  左 rightが3

左をひとつずらす。
その後、step1に戻り右端を進めていく。
```

3. ただし、left == right となったときは、right を 1 進める

```
1 5 9 1 20 5 3 6 5 4
        ↑
        例外

例外として条件に当てはまらない場合がでてくる。
上記でいうと20は15以下ではないのでleft4でright4なので、左を進めてしまうと、
left5とright4になってしまい、おかしくなってしまう。

そこで例外としてleft == rightになった時はrightを進める。
```