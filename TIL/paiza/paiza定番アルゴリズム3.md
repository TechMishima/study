# ToDo
https://paiza.jp/works/mondai<br>
上記の「定番アルゴリズムの習得」を学ぶ<br>
の続き

# Progress
始まり

- 二分探索メニュー

# TIL

## 二分探索メニュー

### 値の探索

**二分探索とは**

>「対象とする探索範囲の中央の値」と「探索したい値」を比較することで、探索範囲を半分にすることができます。このようなアプローチを 二分探索 と呼びます。

自作コード
```
def binary_search(arr, n, k)
    left = 0
    right = n-1
    
    while left <= right
        mid = (left + right) / 2

        if arr[mid] == k
            return true
        elsif arr[mid] < k
            left = mid+1
        else 
            right = mid-1
        end
    end
    
    return false
end

n = gets.to_i
line = gets.split.map(&:to_i)
k = gets.to_i

k.times do
    num = gets.to_i
    is_true = binary_search(line, n, num)
    if is_true == true
        puts "Yes"
    else
        puts"No"
    end
end
```

### lower_bound

自作コード
```
def binary_search(arr, n, k)
    left = 0
    right = n
    
    while left < right
        mid = (left + right) / 2

        if arr[mid] < k
            left = mid+1
        else
            right = mid
        end
    end
    
    return right
end

n = gets.to_i
line = gets.split.map(&:to_i)
line = line.sort!
q = gets.to_i

q.times do
    k = gets.to_i
    puts n - binary_search(line, n, k)
end
```

### upper_bound

**lower_boundとupper_boundってどういう意味？**

- lower_bound
  - lower_boundは、探索したいkey以上の値を返す (a >= key)
- upper_bound
  - upper_boundは、探索したいkeyより大きい値を返す (a > key)

自作コード
```
def binary_search(arr, n, k)
  left = 0
  right = n
  
  while left < right
      mid = (left + right) / 2

      if arr[mid] <= k
          left = mid+1
      else
          right = mid
      end
  end
  
  return n -  right
end

a = gets.to_i
line = gets.split.map(&:to_i)
line = line.sort!
q = gets.to_i
q.times do
    num = gets.to_i
    puts binary_search(line, a, num)
end
```

### ある範囲に含まれている整数の個数

自作コード
```
def binary_search(arr, n, k)
  left = 0
  right = n
  
  while left < right
      mid = (left + right) / 2

      if arr[mid] < k
          left = mid+1
      else
          right = mid
      end
  end
  
  return n - right
end

def binary_search2(arr, n, k)
  left = 0
  right = n
  
  while left < right
      mid = (left + right) / 2

      if arr[mid] <= k
          left = mid+1
      else
          right = mid
      end
  end
  
  return n - right
end

n = gets.to_i
line = gets.split.map(&:to_i)
line = line.sort!
q = gets.to_i

q.times do
  l, r = gets.split.map(&:to_i)
  # puts binary_search(line, n, l)
  # puts binary_search2(line, n, r)
  puts binary_search(line, n, l) - binary_search2(line, n, r)
end
```

### パイプを切り出そう

限界値を求めるので、100回ほど繰り返し処理を行い小数点以下まで精度を高めて検索している。

自作コード
```
n, k = gets.split.map(&:to_i)
pipes = gets.split.map(&:to_i)

left = 0
right = 100000.0

100.times do
    mid = (left + right) / 2
    # puts mid
    num = 0
    pipes.each do |pipe|
        num += (pipe / mid).floor
    end
    
    if num >= k # 判定内
        left = mid
    else
        right = mid 
    end
end

puts right
```

回答
```
n, k = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

left, right = 0.0, 10001.0
100.times do
  mid = (left + right) / 2.0
  num_of_pipes = 0
  A.each do |a|
    num_of_pipes += (a / mid).to_i
  end

  if num_of_pipes < k
    right = mid
  else
    left = mid
  end
end

puts left
```

### 効率よく盗もう

**バイナリーサーチの使うポイント**
- Yes / No で答えられる質問である。
- あるところを境界として，そこより小さいところではずっと Yes だし，そこより大きいところではずっと No である．
- または，あるところを境界として，そこより小さいところではずっと No だし，そこより大きいところではずっと Yes である．

→ どこかで Yes / No が切り替わる質問を考える。

### 途中
n, k = gets.split.map(&:to_i)
weights = gets.split.map(&:to_i)
prices= gets.split.map(&:to_i)
values = []
n.times do |i|
    values << [prices[i], weights[i]] # 価値 = [価格, 重さ]
end

ans = 0

values.combination(k).each do |comb|
    price = comb.sum {|item| item[0]}
    weight = comb.sum {|item| item[1]}
    value = price / weight.to_f
    ans = value if value > ans
end

puts ans