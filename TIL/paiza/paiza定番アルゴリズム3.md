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