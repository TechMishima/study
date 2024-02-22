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
