# ToDo
Aランクレベルアップメニュー
<br>
https://paiza.jp/works/mondai/a_rank_level_up_problems/problem_index?language_uid=ruby

## Til
### 絶対値の取り方
puts(5.abs)    # 5<br>
puts(-5.abs)   # 5

.absを使用する。差を求めるときに使用する。

### べき乗について
https://www.tairaengineer-note.com/ruby-power-operator/
```
2 ** 3
```
上記だと2の3乗で8が出力される

### 出力方法について
https://zenn.dev/nagan/articles/ae479d26e6d2b0
- putsメソッド<br>
オブジェクト出力後に改行する。改行が使える。
- printメソッド<br>
オブジェクト出力後に改行しない。改行が使える。
- pメソッド<br>
オブジェクト出力後に改行する。改行が使えない。

配列の出力
```
a = [1, 2, 3]

# putsメソッドの場合
puts a
1
2
3
=> nil

# printメソッドの場合
print a
[1, 2, 3]=> nil

# pメソッドの場合
p a
[1, 2, 3]
=> [1, 2, 3]
```

- printfメソッド<br>
https://style.potepan.com/articles/29652.html<br>
https://magazine.techacademy.jp/magazine/30649

rn ：表示を改行させます<br>
%幅d : 整数値を指定の桁数で右詰めにします<br>
%-幅d ：整数値を指定の桁数で左詰めにします<br>
%+幅d ：整数値を符号付きで表示します<br>
%0幅d : 整数値の余った空白をゼロで埋めます<br>
%幅.小数点以下桁数f ：小数点以下の桁数を指定しています<br>
%幅s ：文字列を右詰めで表示します<br>
%-幅s ：文字列を左詰めで表示します<br>
%c : 引数の数値を文字コードとみなして対応する文字を出力<br>
%p : inspectメソッドを呼び出した結果を出力<br>
%b, %B : 数値を2進数で出力<br>
%o : 数値を8進数で出力<br>
%d, %i : 数値を10進数で出力<br>
%x, %X : 数値を16進数で出力<br>
%e : 9.999e+10のような指数表現で数値を出力<br>
%% : %そのものを出力（%のエスケープ シーケンス）

### sliceメソッド
https://www.sejuku.net/blog/14690<br>
配列、文字列、特定の条件でハッシュで使用できる。<br>

配列(インデックスを使用したほうがはやい？)
```
array = ["Ruby","Python","Java"]
p array[0]
p array.slice(0)

結果
"Ruby"
"Ruby"
```
配列(最後の番号を指定する)
```
array = ["Ruby","Python","Java"]
p array[-1]
p array.slice(-1)

結果
"Java"
"Java"
```
配列(範囲の指定)
```
array = ["Ruby","Python","Java"]
p array[0,2]
p array.slice(0,2)
p array[0..3]
p array.slice(0..3)

結果
["Ruby","Python"]
["Ruby","Python"]
["Ruby","Python","Java"]
["Ruby","Python","Java"]
```
文字列
```
p "ruby".slice(0) 
p "ruby"[0]

結果
"r"
"r"
```
文字列（範囲で指定）<br>
範囲の指定の際は、0,3と0..3では異なるので注意！！
```
p "ruby".slice(0,3) 
p "ruby".slice(0..3)
p "ruby"[0,3]
p "ruby"[0..3]

結果
"rub"
"ruby"
"rub"
"ruby"
```
ハッシュ（外部ライブラリー使用）
```
require 'active_support'
hash = {"Ruby":"Rails","Python":"Django","PHP":"CakePHP"}
p hash.slice(:Ruby,:Python)
p hash.slice(:Ruby,:PHP)

結果
{:Ruby=>"Rails", :Python=>"Django"}
{:Ruby=>"Rails", :PHP=>"CakePHP"}
```

### 要素の取り出し、追加
https://magazine.techacademy.jp/magazine/30065<br>
1. 先頭要素の取り出し shift
```
arr = [1,2,3,4,5]
a1 = arr.shift

p a1 # => 1
p arr # => [2,3,4,5]
```
2. 先頭要素の追加 unshift
```
arr = [2, 3, 4]
arr.unshift(1) # 配列の先頭に1を追加
puts arr # 出力: [1, 2, 3, 4]
```
3. 最後尾要素の取り出し pop
```
arr = [1,2,3,4,5]
a1 = arr.pop

p a1 # => 5
p arr # => [1,2,3,4]
```
4. 最後尾要素の追加 push
```
arr = [1, 2, 3]
arr.push(4) # 配列の最後尾に4を追加
puts arr # 出力: [1, 2, 3, 4]
```