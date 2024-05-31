# ToDo
- delete_atの使用方法
- deleteメソッドの派生について

# TIL

## delete_at 配列から指定したインデックスの要素を取り除く
https://www.javadrive.jp/ruby/array_class/index11.html<br>
Array クラスで用意されている delete_at メソッドを使用すると配列に格納されている要素の中で指定したインデックスの要素を取り除くことができる。
```
ary = [1, 2, 3, 5, 4, 3]
ary.delete_at(2)
p ary => [1, 2, 5, 4, 3]
```

## 他のdeleteについて学習

### delete_prefixメソッド(文字列)
指定されたプレフィックスが文字列の先頭にある場合、それを削除する。
```
str = "foobar"
result = str.delete_prefix("foo")
puts result # => "bar"
```

### delete_suffixメソッド(文字列)
指定されたサフィックスが文字列の末尾にある場合、それを削除する。
```
str = "foobar"
result = str.delete_suffix("bar")
puts result # => "foo"
```