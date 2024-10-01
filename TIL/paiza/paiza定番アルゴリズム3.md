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