# ToDo
python3 筋トレﾄﾞﾘﾙの受講<br>
https://paiza.jp/works/mondai/cgc_problems/problem_index?language_uid=python3

# Progress
出力とコメント - コメントアウト 5
「変数 - 右辺が変数を使った式 2 Python3編」

# TIL

## hoge,foo,barって？

プログラムで変数名をつける際に、サンプルで使う特に意味のない言葉のこと。

hogeも同様に意味のない言葉。日本のプログラマーが使用することが多い。

## 大文字小文字変換 upper lower 

### 大文字変換 upper
```
c = "p"
print(c.upper())
```

### 小文字変換 lower
```
c = "X"
print(c.lower())
```

## 文字列の検索 find
```
s = "aaapaizabbb"
index = s.find("paiza")
print(index) # 3になる
```

### findとindexはどう違うのか？
https://ittrip.xyz/python/python-string-find-index<br>
- findメソッド : 対象の文字列がない場合、-1を返す。
- indexメソッド : 対象の文字列がない場合、エラーが発生する。

## 特定の範囲の文字列を出力
n文字目からm文字目まではs[n-1:m] ※今回は10-12

```
s = "abcdefghijklmnopqrstuvwxyz"
print(s[9:12])
```