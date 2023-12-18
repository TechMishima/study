# TIL
## .dupメソッドとは？
URL https://www.sejuku.net/blog/76564<br>
dupメソッドとは、オブジェクトのコピーを作成するメソッド

### どんな時に使うの？
前提条件<br>
a,b,cが入った配列lineを用意してlines配列に２つ入れる
```
line = ["a", "b", "c"]
lines = []
2.times { lines << line }
p lines

=> [["a", "b", "c"], ["a", "b", "c"]]
```
次にlinesの一つ目の配列をd,b,cにしたいとする。<br>
下記のコードを入力すると2つの配列が変わってしまう。<br>
linesの2つの配列はlineを参照しているためである。
```
lines[0][0] = "d"
p lines
=> [["d", "b", "c"], ["d", "b", "c"]]
```
どのようにすればよいのか？<br>
linesにline配列を入れるときに.dupメソッドを使用すれば解決できる。
```
2.times { lines << line.dup }
```
もしくは.cloneメソッドでもよい
```
2.times { lines << line.clone }
```

### .dupと.cloneの違いって？
早見表
|メソッド|凍結状態|汚染状態|信頼状態|特異メソッド|
|-|-|-|-|-|
|dupメソッド|コピーしない|コピーする|コピーする|コピーしない|
|cloneメソッド|コピーする|コピーする|コピーする|コピーする|

### 凍結状態って？ freezeメソッドについて
URL https://magazine.techacademy.jp/magazine/19777<br>
freezeメソッドを使用すると破壊メソッドが使用できなくなる。