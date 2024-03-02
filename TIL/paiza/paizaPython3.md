https://paiza.jp/works/python3/primer/beginner-python1

# ToDo
https://paiza.jp/pages/works/stories/crank_python<br>
### 配列
https://note.nkmk.me/python-list-append-extend-insert/
# Python参考ページ
https://docs.python.org/ja/3/reference/index.html<br>
http://qiita.com/rohinomiya/items/aab6b16d1a470871713c<br>
### Python note
https://note.nkmk.me/python/

# TIL

## Pyhonについて
- 開発しやすいスクリプト言語である。
- 統計処理・人口知能の分野で活躍している。
- 本格的なWebサービスでも活躍されている。
- YoutubeはPythonで作られている。
- 誰が書いても同じような書き方になる。

## paiza
### 出力方法
```
print("Hello world")
```
### コメントアウト
#を頭につける
```
# print("Hello world")
```
### 変数
1文字目は数字を使わない（エラーになる
```
greeting = "Hello world"
print(greeting)  # Hello world
```
### データの受け取り
```
name = input()
print("Hello " + name)
```
### 数値⇔文字列への変換
```
# 数値 int
number = int(input())
# 文字列 str
str(number * 10)
```
### if文
```
if greeting == "Hello":
    print("こんにちは")
elif greeting == "Good morning":
    print("おはよう")
else:
    print("はじめまして")
```

### 繰り返し処理
```
greeting = "Hello world"
for i in range(5):
    print(greeting + str(i))
```

### 文字列の長さ
```
len("Hello") # 5
```

### リスト
リストとは配列のこと。pythonではリストと呼ばれる。
```
番号でデータを参照
print(team[0])

番号を計算で求める
print(team[n + 1])

データの個数
print(len(team))
```
リストの指定
```
team = ["勇者", "魔法使い"]
```
リストの操作
```
末尾に要素の追加
team.append("戦士")

要素の上書き
team[0] = "ドラゴン"

要素の削除
team.pop(0)
```
標準入力 分割してリストに格納する split関数
```
カンマで区切って格納する方法
line = input().rstrip().split(",")
```
標準入力 複数行の入力データ
```
import sys
array = []
for line in sys.stdin.readlines():
    array.append(rstrip())
```
### 辞書
pythonではハッシュの事を辞書と呼ぶ
```
enemyDictionary = {"ザコ":"スライム", "中ボス":"ドラゴン", "ラスボス":"魔王"}
print(enemyDictionary)
print(enemyDictionary["中ボス"])
```
辞書の基本操作
```
辞書のデータ数を返す
print(len(enemies))

データの追加と修正
enemies["ザコ2"] = "メタルモンスター"

データの削除
del enemies["ザコ"]
```
辞書のループ処理
```
キーのみ取り出す
for key in enemies:
	print(key)

値のみ取り出す
for rank in enemies:
	print(enemies[rank] + "が、あらわれた！")

キーと値を取り出す itemsメソッド
for (rank, enemy) in enemies.items():
	print(rank + "の" + enemy + "が、あらわれた！")
```
### リストの整列
リストをアイウエオ順に並び変えることが出来る。<br>
パラメータにリバースを設定すると、降順にすることが出来る。<br>
数字の順番にもすることが出来る。<br>
漢字は適応外
```
print(sorted(weapons))
print(sorted(weapons, reverse=True))
```
### 辞書の整列
辞書をキーの順番に並び替えることができる。<br>
```
weapons = {"イージスソード":40, "ウィンドスピア":12, "アースブレイカー":99}
キーのみ出力
print(sorted(weapons))
キーとデータを出力
print(sorted(weapons.items()))
```
タプルとは？<br>
データ構造の一種である<br>
内容の更新はできない<br>
変更ができないということはプログラムの安全性を確保される意味を持っている。
### 2次元リスト
作成
```
team_a = ["勇者", "戦士", "魔法使い"]
team_b = ["盗賊", "忍者", "商人"]
team_c = ["スライム", "ドラゴン", "魔王"]

teams = [team_a, team_b, team_c]
print(teams)
```
リストの長さについて<br>
下記のコードだと4.2が出力される<br>
4 ・・・ teamsの中にはリストが４つ含まれているから<br>
2 ・・・ インデックスが0、一番左のリストにはデータが2つ含まれているから
```
teams = [["勇者", "戦士"], ["盗賊", "忍者", "商人"], ["スライム", "ドラゴン", "魔王"], ["魔法使い"]]
print(len(teams))
print(len(teams[0]))
```
enumerateについて<br>
リストのループ処理でインデックスも欲しい時に使用する
```
for (i, person) in enumerate(team):
    print(str(i + 1) + "番目の" + person + "が、スライムと戦った")
```
1行の繰り返し処理<br>
下記コードを動かすと1,1,1,1,1,1,1,1,1,1となる
```
numbers = [1 for i in range(10)]
```
0,2,4,6,8,10,12,14,16,18パターン
```
numbers = [i * 2 for i in range(10)]
```
### 条件分岐 and or
```
for j,area in enumerate(line):
        if (i % 2 == 0 or j % 3 == 0) and area == "森":
            print("＋", end="")
        else:
            print(area, end="")
```

### 関数
作成と呼び出し
```
def say_hello():
    print("hello world")

say_hello()
say_hello()
```
引数と戻り値の追加
```
def sum(x, y):
    return x + y

num1 = sum(3, 4)
print(num1)
```
### スコープについて(rubyとの違い)
関数外で定義した変数も使用できる。（違い<br>
関数内で再度定義した変数は外で使用できない
```
a = "apple"

def message():
    print(a)

message()
```

### グローバル変数とローカル変数について
グローバル変数は関数外で定義、ローカル変数は関数内で定義する。
### ローカル変数
```
def my_function():
    local_variable = 10
    print(local_variable)

my_function()
# print(local_variable)  # これはエラーになる。関数外でのアクセスはできない。
```
### グローバル変数
関数内で使用することは推奨されていない。
```
global_variable = "global value"

def my_function():
    print(global_variable)

my_function()
print(global_variable)  # 関数外でもアクセス可能
```
### 関数内でグローバル変数を宣言する
```
global_variable = "global value"

def update_global_variable():
    global global_variable
    global_variable = "updated value"

update_global_variable()
print(global_variable)  # "updated value" が出力される
```

## 引数
### デフォルト値
引数が足りない時に参照する
```
def introduce(greeting, name = "村人"):
    print("私は" + name + "です。" + greeting)

introduce("こんにちは", "勇者")
introduce("こんにちは")
```

### 可変長引数
引数が多い時に参照する
```
def introduce(greeting, *names):
    for name in names:
        print("私は" + name + "です。" + greeting)

introduce("こんにちは", "勇者", "村人", "兵士")
```

### 可変長引数 - 辞書
キーと値を使用して、参照する
```
def introduce(**people):
    for name, greeting in people.items():
        print("私は" + name + "です。" + greeting)

introduce(hero = "はじめまして", villager = "こんにちは", soldier = "よろしくお願いします")
```
### キーワード引数
デフォルト値を複数使用するときにラベルをつけられる
```
def say_hello(greeting = "hello", target = "world"):
    print(greeting + " " + target)

say_hello()
say_hello("こんにちは", "皆さん")
say_hello(greeting = "ネコ先生", target = "皆さん")
say_hello(target = "ネコ先生", greeting = "おはようございます")
```

## クラスについて
### オブジェクトとは
変数とメソッドをセットにしたもの。クラスからオブジェクトを作って利用する。<br>

クラス: オブジェクトの設計図<br>
オブジェクト: クラスから作成したもの<br>

### クラスの作成
引数にselfをいれる<br>
クラス名は頭大文字で命名する<br>
```
class Player:
    def walk(self):
        print("勇者は荒野を歩いていた")
```
### オブジェクトの作成
```
player1 = Player()
```
### メソッドの呼び出し
```
player1.walk()
```
### コンストラクタ
オブジェクト作成時に自動的に呼び出されるメソッド<br>
rubyでいうinitializeメソッドの事
```
class Player:
    def __init__(self, job):
        self.job = job

    def walk(self):
        print(self.job + "は荒野を歩いていた")

player1 = Player("戦士")
player1.walk()
```
### インスタンス変数
上記のself.jobがインスタンス変数と呼ばれる。<br>
インスタンス変数は、インスタンスが持つ変数。<br>
インスタンス変数は、インスタンスがある限りデータが保持される。<br>

### クラス変数
クラス変数を宣言したクラスのインスタンス全てで共有して利用できる変数。

### デフォルトで設定されているメソッドについて
capitalizeメソッド・・・全部小文字にしてくれるメソッド<br>
upperメソッド・・・全部大文字にしてくれるメソッド<br>
removeメソッド・・・特定の要素をリストから削除するメソッド<br>
appendメソッド・・・要素を追加するメソッド<br>
上記の他にもさまざまなメソッドが用意されている。

```
text = "pYthon"
print(text)
print(text.capitalize())
print(text.upper())

players = "勇者,戦士,魔法使い,忍者"
list = players.split(",")
print(list)
list.remove("忍者")
print(list)
list.append("霧島")
print(list)
```
islowerメソッド<br>
全部小文字ならTrueを、違うならFalseを返す。
```
msg.islower()
```
## アクセス制限について
メソッドの前にアンダーバーをふたつ(__)つけるとプライベートメソッドになる。<br>
クラスの外から呼び出すことはできなくなる。<br>
```
class Player:
    def __init__(self, job, weapon):
        self.job = job
        self.weapon = weapon

    def walk(self):
        print(self.job + "は荒野を歩いていた")
        self.__attack("スライム")

    def __attack(self, enemy):
        print(self.weapon + "で" + enemy + "を攻撃")


player1 = Player("戦士", "剣")
player1.walk()
# player1.__attack("スライム")
```
変数の前にアンダーバーをふたつ(__)つけるとプライベート変数、またはプライベートプロパティになる。<br>
クラスの外から呼び出すことはできなくなる。<br>
```
class Player:
    def __init__(self, job, weapon):
        self.job = job
        self.__weapon = weapon

    def walk(self):
        print(self.job + "は荒野を歩いていた")
        self.__attack("スライム")

    def __attack(self, enemy):
        print(self.__weapon + "で" + enemy + "を攻撃")


player1 = Player("戦士", "剣")
player1.walk()
# print(player1.__weapon)
```
### クラスの継承
クラスの継承は、既存のクラスを使用して新しいクラスを作成する機能。<br>
子クラスは、親クラスの属性やメソッドを継承し、同時に独自の属性やメソッドを追加できる。<br>
親クラスの事をスーパークラス、子クラスの事をサブクラスと呼ぶこともある。<br>
### メソッドのオーバーライド
子クラスが親クラスのメソッドを再定義することを指します。

### 継承の記述
```
class Box:
    def __init__(self, item):
        self.item = item

    def open(self):
        print("宝箱を開いた。" + self.item + "を手に入れた。")

class JewelryBox(Box):
    def look(self):
        print("宝箱はキラキラと輝いている。")

jewelrybox = JewelryBox("魔法の指輪")
jewelrybox.look()
jewelrybox.open()
```

### オーバーライドの記述
```
class Box:
    def __init__(self, item):
        self.item = item

    def open(self):
        print("宝箱を開いた。" + self.item + "を手に入れた。")

class MagicBox(Box):
    def look(self):
        print("宝箱は、妖しく輝いている。")

    def open(self):
        print("宝箱を開いた。" + self.item + "が襲ってきた！")

magicbox = MagicBox("モノマネモンスター")
magicbox.look()
magicbox.open()
```
### ネームマングリング
プログラム内でクラスの属性やメソッドの名前を変更する手法のこと
```
wizard._Wizard__spell()
```

### スーパークラスのメソッドの呼び出し
```
class Wizard(Player):
    def __init__(self):
        super().__init__("魔法使い")
```

### クラス関数
オブジェクト間で共通して利用できる変数のこと。
```
class Player:
    charactor_count = 0

    def __init__(self, name):
        self.name = name
        Player.charactor_count += 1
        print(str(Player.charactor_count) + "番目のプレイヤー、" + self.name + "が登場した。")

```

### クラスメソッド
オブジェクト間で共通して利用できるメソッドのこと。
```
class Player:
    __charactor_count = 0

    def summary(cls):
        print(str(Player.__charactor_count) + "人で、スライムを攻撃した。")
    
    summary = classmethod(summary)

Player.summary()
```
```
class Player:
    __charactor_count = 0

    @classmethod
    def summary(cls):
        print(str(Player.__charactor_count) + "人で、スライムを攻撃した。")

Player.summary()
```
### 標準ライブラリ
呼び出し方
```
from モジュール import クラス
```
datetimeモジュールだと
```
from datetime import datetime

today = datetime.now()
print(today)
```
## 例外処理 exception
- try あらかじめコードを指定して、プログラム実行時に、処理の問題を検出
- except 問題を検出した時、どのように対応するか記述しておく
- raise 対応を記述していない場合、メソッドの呼び出し元に対応を任せる

### 簡単な例外処理
tryブロック ・・・ 例外処理が出てくる可能性があるコード
exceptブロック ・・・ 例外が発生したときに処理するコード
finallyブロック ・・・ 例外が発生しても処理をしたいコード
```
print(1)
try:
    number = 0
    answer = 100 / number
    print(answer)
except ZeroDivisionError as e:
    print(e)
finally:
    print(2)
```