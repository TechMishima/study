# ToDo
python3 筋トレﾄﾞﾘﾙの受講<br>
https://paiza.jp/works/mondai/cgc_problems/problem_index?language_uid=python3

# Progress
出力とコメント - コメントアウト 5<br>
「変数 - 右辺が変数を使った式 2 Python3編」<br>
条件分岐と等価演算子 - 比較と代入の違い 3<br>
条件分岐と関係演算子 - 数値の大きさの比較 4 <br>
条件の結合と否定 - 論理型の変数 1<br>
年月日の計算 - 和暦の西暦への変換 1<br>
年月日の計算 - 小の月の判定 1<br>
標準入力 - 1 行の入力 2<br>
入力データの処理 - 入力データとif文2<br>
入力データの処理 - 入力データと暦年 4<br>
定数回のループ - while 文で数値を順に出力 3<br>
様々なループ - 複数の乱数の出力 2<br>
様々なループ - 3 ずつ減少させる 2<br>
ループと入力 - 複数の文字列の連結 4<br>
ループと条件分岐 - 奇数の出力 1<br>
ループと条件分岐 - 大小関係による処理の分岐 1<br>
ループと条件分岐 - Fizz Buzz4<br>
(終了)


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

## True,Falseの出力
```
print(s == t)
```

## データの型
- int : 整数
- str : 文字列
- float : 実数(小数点以下含むなど)

## 小数点以下の桁数を指定する

https://magazine.techacademy.jp/magazine/23378

### 桁数を指定して出力する方法


formatを使用する<br>
例だと先頭に3文字分の余白が追加されて表示されている。<br>
「整数部3桁 + 小数点を意味するドットで1桁 + 小数部3桁」の合計 7桁だから。<br>
実際の数値よりも少ない桁数を指定してもそのまま表示される<br>
```
num = 123.456
print('{:10}'.format(num))
# =>    123.456

num = 123.456
print('{:2}'.format(num))
# => 123.456
```

f文字列を使用する<br>
f”もしくは f”” で囲むと、{} 内に変数などを指定できる。
```
num = 123.456
print(f'{num:10}')
# =>    123.456

print(f'{num:2}')
# => 123.456
```

### 小数点以下の桁数を指定して出力する方法

formatを使用する<br>
ゼロ埋めして表示したい場合には {:.08f} と指定
```
num = 123.456
print('{:.1f}'.format(num))
# => 123.5

num = 123.456
print('{:.08f}'.format(num))
# => 123.45600000
```

f文字列を使用する
```
num = 123.456
print(f'{num:.1f}')
# => 123.5

print(f'{num:.08f}')
# => 123.45600000
```

## randomモジュールについて

https://www.sejuku.net/blog/20915

### random.random 基礎ランダム
0.0から1.0の範囲のfloat型の値を返す。
```
num = random.random()
print(num)

# => 0.08114641703637393
```

### random.uniform 指定した範囲の実数
```
num = random.uniform(2.0,5.0)
print(num)

# => 3.8989018807071822
```

### random.choice 配列の中身をランダムに取得
choice関数を使用することで、規則性の無い数字の乱数を取得できる。
```
mylist = ["apple", "banana", "melon", "strawberry", "peach", "lemon"]
print(random.choice(mylist))

# => melon
```

## if not
https://www.sejuku.net/blog/65070<br>
条件式の結果が真であれば偽、偽の場合は真を返す演算子

```
str1 = "apple"
if not str1 == "orange":
    print(True)
else:
    print(False)

# => True
```
### 気をつけなくてはいけないこと
```
x = 10
y = 20
 
if not x == 10 or y == 20:
    print(True)

# => True
```
上記はx == 10はnotにかかっているが、y == 20にはかかっていないのでTrueになる。

```
x = 10
y = 20

if not x == 10 or not y == 20:
    print(True)
else:
    print(False)
```
上記にすることでどちらにもnotがつけられる。


## if文の条件分岐
https://note.nkmk.me/python-if-elif-else/

### if True: と if False:について
常にTrue,Falseになるのでデバッグとして使用する。
```
if True:
    print("This block will always execute.")
```

### ==演算子とis演算子の違い
==演算子は値が等しければTrue,is演算子はオブジェクトが等しければTrueになる。
```
l1 = [1, 2, 3]
l2 = [1, 2, 3]
print(l1 == l2)
# True

print(l1 is l2)
# False
```
```
l3 = l1
print(l1 is l3)
# True
```

### 条件式を改行して複数行で記述
バックスラッシュを使うかかっこで囲む
```
def if_backslash():
    if too_long_name_function_1() \
       and too_long_name_function_2() \
       and too_long_name_function_3():
        print('True')
    else:
        print('False')
```
```
def if_parentheses():
    if (
        too_long_name_function_1()
        and too_long_name_function_2()
        and too_long_name_function_3()
    ):
        print('True')
    else:
        print('False')
```

## 複雑な条件式の記述
if trueを使用する。<br>
下記だとnumが1の場合、aにtrueが入る。<br>
if trueになるので可能が出力される。
```
a = num == 1
if a:
    print("可能")
```
下記の問題ではx1,x2,x3の条件がすべて満たされた場合、省略可が出力される。<br>
可読性の高いコードを書くために、条件を分けて記述することも大切である。
```
# ----------------------------------------
# [条件の結合と否定 - 複雑な論理式1]
# ----------------------------------------
# 条件x1, x2, x3がすべて満たされるならば
# "省略可"そうでなければ、"省略不可"と出力してください

a = 5
b = 18
c = 3

x1 = a != 0
x2 = b * b - 4 * a * c > 0
x3 = b % 2 == 0

if x1 and x2 and x3:
    print("省略可")
else:
    print("省略不可")
```

## 記述が長くなってしまう場合
バックスラッシュを使用することで、行をまたぐことができる。
```
import random
month = random.randint(1, 12)

# 2, 4, 6, 9, 11月ならば"small"
if month == 2 or month == 4 or \
    month == 6 or month == 9 or \
    month == 11:
    print("small")
else:
    print("large")
print("month is " + str(month))
```

## 差分を考慮したrange関数
https://atmarkit.itmedia.co.jp/ait/articles/2011/20/news018.html

```
# 初期値1、最終値9、差分2の等差数列：1、3、5、7、9
r = range(1, 10, 2)
print(list(r))  # [1, 3, 5, 7, 9]

# 降順の数列（初期値9、最終値0、差分-1）：9、8、7、6、5、4、3、2、1、0
r = range(9, -1, -1)
print(list(r))  # [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
```

## FizzBuzz問題とは
https://e-words.jp/w/FizzBuzz%E5%95%8F%E9%A1%8C.html<br>
FizzBuzz問題（フィズバズ問題）とは、英語圏の有名な言葉遊びである “Fizz Buzz” （フィズバズ）のルールをコンピュータプログラムに実装したもの。<br>
プログラミング初心者向けの簡単な例題としてよく知られている。

ルールは単純で、1から順に数を数え上げていき、3の倍数なら「Fizz」、5の倍数なら「Buzz」、両方の倍数（15の倍数）なら「Fizz Buzz」、いずれでもなければその数を言う。<br>
「1」「2」「Fizz」「4」「Buzz」「Fizz」「7」「8」「Fizz」「Buzz」「11」「Fizz」「13」「14」「Fizz Buzz」「16」…のように進行する。

## import math floor
https://utokyo-ipp.github.io/5/5-1.html