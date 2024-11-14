# ToDo
https://paiza.jp/works/mondai<br>
上記の「定番アルゴリズムの習得」を学ぶ<br>
の続き

# Progress
始まり

- スタック・キューメニュー
- 連結リストメニュー

# TIL

## スタック・キューメニュー

### スタック・キュー実装編( 共通問題 ) step 1

```
n = gets.to_i
line = []
n.times do
    val = gets.to_i
    line << val
end

puts n
puts line
```

### スタック・キュー実装編( 共通問題 ) step 2

```
n = gets.to_i
arr = []

n.times do
    line = gets.split.map(&:to_i)
    arr << line[1] if line[0] == 1
end

puts arr.length
puts arr
```

### スタック実装編 step 1

> スタックとは、「先入れ後出し構造( Last In, First Out )」などと呼ばれるデータ構造で、
データの追加と、最後に追加したデータを取り出すことができます。

> push : 最後尾にデータを追加<br>
pop : 最後尾のデータを取り出す

```
n = gets.to_i
arr = []

n.times do
    line = gets.split.map(&:to_i)
    if line[0] == 1
        arr.push(line[1])
    elsif line[0] == 2
        a = arr.pop
    end
    puts arr.join(" ")
end
```

### スタック実装編 step 2

```
n = gets.to_i
arr = []

n.times do
    line = gets.chomp.split
    if line[0].to_i == 1
        arr.push(line[1])
        puts arr.join(" ")
    elsif line[0].to_i == 2
        a = arr.pop
        puts a
        puts arr.join(" ")
    end
end
```

### キュー実装編 step 1

> キューとは、「先入れ先出し構造( First In, First Out )」などと呼ばれるデータ構造で、
データの追加と、最初に追加したデータを取り出すことができます。

> push : 最後尾にデータを追加<br>
shift : 先頭のデータを取り出す

```
n = gets.to_i
arr = []

n.times do
    line = gets.split.map(&:to_i)
    if line[0] == 1
        arr.push(line[1])
    elsif line[0] == 2
        a = arr.shift
    end
    puts arr.join(" ")
end
```

### キュー実装編 step 2

```
n = gets.to_i
arr = []

n.times do
    line = gets.chomp.split
    if line[0].to_i == 1
        arr.push(line[1])
        puts arr.join(" ")
    elsif line[0].to_i == 2
        a = arr.shift
        puts a
        puts arr.join(" ")
    end
end
```

### 2つのキュー

```
n = gets.to_i
arr1 = []
arr2 = []

n.times do
    line = gets.split.map(&:to_i)
    if line[0] == 1
        if line[1] == 1
            arr1 << line[2]
        else
            arr2 << line[2]
        end
    elsif line[0] == 2
        if line[1] == 1
            val = arr1.shift
            puts val
        else
            val = arr2.shift
            puts val
        end
    else
        print arr1.length
        print " "
        print "#{arr2.length}\n"
    end
end
```

### 最大の区間和

```
n, x = gets.split.map(&:to_i)
arr = gets.split.map(&:to_i)
sum_arr = [0]
a_sum = 0
arr.each do |val|
    a_sum += val
    sum_arr << a_sum
end

max_num = 0
sum_max = 0
(n-x+1).times do |i|
    sum = sum_arr[i+x] - sum_arr[i]
    if sum > sum_max
        sum_max = sum
        max_num = arr[i]
    end
end

print sum_max
print " "
puts max_num
```

上記はスタック、キューを使ったコードではないため、練習として使用したコードを作成してみる。

```
n, x = gets.split.map(&:to_i)
arr = gets.split.map(&:to_i)
sum_arr = []
sum = 0

(x-1).times do |i|
    sum += arr[i]
    sum_arr.push(arr[i])
end

max_num = 0
sum_max = 0

(n-x+1).times do |i|
    push_num = arr[i+x-1]
    sum_arr.push(push_num)
    sum += push_num
    num = sum_arr.shift
    
    if sum > sum_max
        sum_max = sum
        max_num = num
    end
    
    sum -= num
end

print sum_max
print " "
puts max_num
```

### 逆ポーランド記法

> https://www.seplus.jp/dokushuzemi/ec/fe/fenavi/kind_basic_theory/reverse-polish-notation/
>>【逆ポーランド記法の計算式の値を得る手順】<br>
（1） 逆ポーランド記法の計算式の先頭から順に1文字ずつ取り出す。<br>
（2） 取り出した文字が値（変数や数値）ならスタックにプッシュする。<br>
（3） 取り出した文字が演算子ならスタックから2つのデータをポップし、両者の演算結果の値をスタックにプッシュする。<br>
（4） （1）に戻って繰り返し、最後の文字を取り出して処理したら、その時点でスタックに残っている1つの値が計算式の値である。

自作コード

```
n = gets.to_i
arr = gets.chomp.split
stack = []

arr.each do |val|
    if val == "+"
        int1 = stack.pop
        int2 = stack.pop
        int = int2 + int1
        stack.push(int)
    elsif val == "-"
        int1 = stack.pop
        int2 = stack.pop
        int = int2 - int1
        stack.push(int)
    else
        int = val.to_i
        stack.push(int)
    end
end

puts stack
```

### 括弧列

自作コード

```
n = gets.to_i
kakko = gets.chomp.split("")
stock = []
ans = true

while kakko.empty? == false
    a = kakko.shift
    if a == "("
        stock.push(a)
    elsif a == ")" || stock.empty? == true
        b = stock.pop
        if b != "("
            ans = false
        end
    end
    
    break if ans == false
end

if stock.empty? == true && ans == true
    puts "Yes"
else
    puts "No"
end
```

回答

```
n = gets.to_i
s = gets.chomp

stack = []

n.times do |i|
  if !stack.empty? && stack[-1] == "(" && s[i] == ")"
    stack.pop
  else
    stack.push(s[i])
  end
end

if stack.empty?
  puts "Yes"
else
  puts "No"
end
```

### エスカレーター

間違いコード（なぜ？<br>

```
n, k = gets.split.map(&:to_i)
menbers = gets.split.map(&:to_i)
stock = []
n.times do |i|
    stock << menbers[i]
    stock.each do |menber|
        if (menbers[i] - menber) < k
            break
        else
            a = stock.shift
        end
    end
    puts stock.length
end
```

stock.each doを行い、途中でshiftで削除してしまうとおかしくなってしまう。

> 例: 提出されたコードの動作を詳しく追う<br>
入力<br>
n = 6, k = 3<br>
menbers = [1, 2, 3, 7, 8, 9]<br>
<br>
各ステップの動作<br>
4番目のループ（i = 3）を重点的に確認します。<br>
i = 0:<br>
stock = [1]<br>
出力: 1<br>
<br>
i = 1:<br>
stock = [1, 2]<br>
出力: 2<br>
<br>
i = 2:<br>
stock = [1, 2, 3]<br>
出力: 3<br>
<br>
i = 3:<br>
現在のstock = [1, 2, 3, 7]<br>
stock.eachのループが始まります。<br>
**最初の要素1**に対してif (menbers[i] - menber) < kをチェック。<br>
7 - 1 = 6でk以上なので、shiftで1を削除し、stockが[2, 3, 7]になります。<br>
**次の要素2**に対して再度チェック。<br>
※しかしここで参照されるのはindex1の[3]が対象されてしまう。<br>
7 - 3 = 4でk以上なので、再びshiftで2を削除し、stockが[3, 7]になります。<br>
**次の要素3**に対してチェックするはずですが、ここで問題が発生します。<br>
stock.eachは、1を削除した時点で、stock配列が変更されたものの、ループの状態は保持されたままなので、次の要素として7が選択されます。<br>
結果として、3がスキップされ、チェックされません。<br>
結果: stockが[7]となり、出力は2になります。<br>

提出してもらったコード

whileにしているので、ちゃんとした対象に処理できている。

```
# 入力を受け取る
n, k = gets.split.map(&:to_i)
menbers = gets.split.map(&:to_i)

# 配列stockを初期化
stock = []

# 各メンバーに対して処理を行う
n.times do |i|
    # stockに現在のメンバーを追加
    stock << menbers[i]

    # stockの先頭メンバーと現在のメンバーの差がk以上なら古いメンバーを削除
    while (menbers[i] - stock[0]) >= k
        stock.shift
    end

    # 現在のstock配列の長さを出力
    puts stock.length
end
```

間違いコードを修正してみた

```
n, k = gets.split.map(&:to_i)
menbers = gets.split.map(&:to_i)
stock = []
n.times do |i|
    count = 0
    stock << menbers[i]
    stock.each do |menber|
        if (menbers[i] - menber) < k
            break
        else
            count += 1
        end
    end
    
    if count != 0
        count.times do
            stock.shift
        end
    end
    puts stock.length
end
```

### 箱とボール

```
n = gets.to_i
balls = gets.split.map(&:to_i)
stock = []

n.times do |i|
    stock << balls[i]
    fin = false
    while stock.length > 1 && fin == false
        if stock[-1] == stock[-2]
            a = stock.pop
            b = stock.pop
            sum = a+b
            stock.push(sum)
        else
            fin = true
        end
    end
end

while stock.empty? == false
    ball = stock.pop
    puts ball
end
```

## 連結リストメニュー

連結リストとは？

>https://zenn.dev/masahiro_toba/books/436c018f5cd4e2/viewer/af0195
>> - 連結リストのメリット<br>
連結リストのメリットは追加・削除などの変更に柔軟に対応できる点です。<br>
データが追加・削除されてもその前後のデータを変更させるだけで良いので、カンタンに変更に対応できます。<br>
追加・削除が頻繁に行われるプログラムの場合によく使われます。<br>
>> - 連結リストのデメリット<br>
連結リストを例えるなら、やたらページ遷移の多いWebサイトのようなモノです。<br>
映画のおすすめランキングを１〜１０位まで紹介するWebサイトでは、やたらと次へボタンが多いですよね。<br>
これは少しでもPVを稼ごうという戦略なのですが、私たちからする１位に辿り着くには、１０回もクリックしなければならなかったりします。<br>
これと同じで連結リストは、目的のデータを見つけるのに１個１個要素を辿る必要があります。<br>そのため、データの探索に時間がかかります。

手順にそって実装する

### 片方向リスト実装編 step 1

> まず要素を保持する配列( value )と次のノードのインデックスを保持する配列( next_ptr )を用意しましょう。<br>
両方とも 1,024 個の要素を持つ配列で、 value の先頭の要素の値と末尾の要素の値は - 1 、 next_ptr の先頭の要素の値は 1,023 、 next_ptr の末尾の要素の値は - 1 で初期化します。<br>
また、末尾の要素の一つ前の要素のインデックスを保持する変数( back )と、 value に要素が入っていない最も小さいインデックスを保持する変数( empty_min_idx )を用意します。<br>
 back は 0 、 empty_min_idx は 1 で初期化します。


最初の自作
```
# valueは1,024 個の要素を持つ配列で、先頭の要素の値と末尾の要素の値は -1
value = Array.new(1024)
value[0] = -1
value[-1] = -1

# next_ptrは1,024 個の要素を持つ配列で、先頭の要素の値は 1,023 、末尾の要素の値は - 1 で初期化
next_ptr = Array.new(1024)
next_ptr[0] = 1023
next_ptr[-1] = -1

# back は 0 、 empty_min_idx は 1 で初期化
back = 0
empty_min_idx = 1

n = gets.to_i
n.times do
    num = gets.to_i
    puts num
end
```

解説
```
value = Array.new(1024)
next_ptr = Array.new(1024)
empty_min_idx = 1 # まだ使用していない配列の要素で、最も小さいインデックス
back = 0 # リストの末尾のインデックス
start_ptr = 0 # リストの先頭のインデックス
end_ptr = 1023 # リストの末尾の次のインデックス

n = gets.to_i
value[start_ptr] = value[end_ptr] = -1
next_ptr[start_ptr] = end_ptr
next_ptr[end_ptr] = -1

n.times do |i|
  value[i] = gets.to_i
end

n.times do |i|
  puts value[i]
end
```

解説を見ると、valueに入力から受け取った数値を保管してから出力しているので修正してみる。

修正後自作コード
```
# valueは1,024 個の要素を持つ配列で、先頭の要素の値と末尾の要素の値は -1
value = Array.new(1024)
value[0] = -1
value[-1] = -1

# next_ptrは1,024 個の要素を持つ配列で、先頭の要素の値は 1,023 、末尾の要素の値は - 1 で初期化
next_ptr = Array.new(1024)
next_ptr[0] = 1023
next_ptr[-1] = -1

# back は 0 、 empty_min_idx は 1 で初期化
back = 0
empty_min_idx = 1

n = gets.to_i
n.times do |i|
    value[i] = gets.to_i
end

n.times do |i|
    puts value[i]
end
```

### 片方向リスト実装編 step 2

> 片方向リストの末尾に要素 X を追加するには
>1. 配列 value の empty_min_idx 番目に要素を代入
>2. 配列 next_ptr の値を変更
>3. 変数 back の値を変更
>4. 変数 empty_min_idx の値を変更

```
value = Array.new(1024)
next_ptr = Array.new(1024)
empty_min_idx = 1 # まだ使用していない配列の要素で、最も小さいインデックス
back = 0 # リストの末尾のインデックス
start_ptr = 0 # リストの先頭のインデックス
end_ptr = 1023 # リストの末尾の次のインデックス

# push_back関数
def push_back(a, value, next_ptr, empty_min_idx, back, end_ptr)
  value[empty_min_idx] = a
  next_ptr[back] = empty_min_idx
  next_ptr[empty_min_idx] = end_ptr
  back = empty_min_idx
  empty_min_idx += 1
  return empty_min_idx, back
end

# print_list_values関数
def print_list_values(value, next_ptr, start_ptr, end_ptr)
  current_ptr = start_ptr
  while current_ptr != end_ptr
    if current_ptr != start_ptr
      puts value[current_ptr]
    end
    current_ptr = next_ptr[current_ptr]
  end
end

# メイン処理
value[start_ptr] = value[end_ptr] = -1
next_ptr[start_ptr] = end_ptr
next_ptr[end_ptr] = -1

n = gets.to_i

n.times do
  a = gets.to_i
  empty_min_idx, back = push_back(a, value, next_ptr, empty_min_idx, back, end_ptr)
end

print_list_values(value, next_ptr, start_ptr, end_ptr)
```

### 片方向リスト実装編 step 3

> 片方向リストの先頭に要素を追加するには
> 1. 配列 value 変数の empty_min_idx 番目に要素を代入
>2. 配列 next_ptr を変更
>3. 変数 empty_min_idx を変更

```
value = Array.new(1024)
next_ptr = Array.new(1024)
empty_min_idx = 1 # まだ使用していない配列の要素で、最も小さいインデックス
back = 0 # リストの末尾のインデックス
start_ptr = 0 # リストの先頭のインデックス
end_ptr = 1023 # リストの末尾の次のインデックス

# push_front
def push_front(a, value, next_ptr, empty_min_idx, start_ptr, end_ptr)
    value[empty_min_idx] = a
    next_ptr[empty_min_idx] = next_ptr[start_ptr]
    next_ptr[start_ptr] = empty_min_idx
    empty_min_idx += 1
    return empty_min_idx, start_ptr
end

# push_back関数
def push_back(a, value, next_ptr, empty_min_idx, back, end_ptr)
  value[empty_min_idx] = a
  next_ptr[back] = empty_min_idx
  next_ptr[empty_min_idx] = end_ptr
  back = empty_min_idx
  empty_min_idx += 1
  return empty_min_idx, back
end

# print_list_values関数
def print_list_values(value, next_ptr, start_ptr, end_ptr)
  current_ptr = start_ptr
  while current_ptr != end_ptr
    if current_ptr != start_ptr
      puts value[current_ptr]
    end
    current_ptr = next_ptr[current_ptr]
  end
end

# メイン処理
value[start_ptr] = value[end_ptr] = -1
next_ptr[start_ptr] = end_ptr
next_ptr[end_ptr] = -1

n = gets.to_i

n.times do
  a = gets.to_i
  #empty_min_idx, back = push_back(a, value, next_ptr, empty_min_idx, back, end_ptr)
  empty_min_idx, start_ptr = push_front(a, value, next_ptr, empty_min_idx, start_ptr, end_ptr)
end

print_list_values(value, next_ptr, start_ptr, end_ptr)
```

### 片方向リスト実装編 step 4

>片方向リストから末尾の要素を削除するには
>1. 変数 back の前のノードの next_ptr を変更する
>2. 変数 back を変更