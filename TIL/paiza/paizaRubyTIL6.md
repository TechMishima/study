# ToDo
学習したことのアウトプット

# TIL

## (!<=)以下ではない条件式が使用できないので代わりを考える
x !<=y は使用できないので他の案を考える。

### 1 >演算を使用する
「以下ではない」という条件は「より大きい」という意味です。そのため、>を使うことで表現できます。
```
if x > y
  puts "xはyより大きい"
end
```

### 2 否定演算子!と<=を組み合わせる
条件を否定する形で表現することも可能です。
```
if !(x <= y)
  puts "xはy以下ではない"
end
```

### 3 自作案 falseを組み合わせる
```
if (x <= y) == false
  puts "xはy以下ではない"
end
```