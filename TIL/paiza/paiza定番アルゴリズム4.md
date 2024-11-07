# ToDo
https://paiza.jp/works/mondai<br>
上記の「定番アルゴリズムの習得」を学ぶ<br>
の続き

# Progress
始まり

- スタック・キューメニュー

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
