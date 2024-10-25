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