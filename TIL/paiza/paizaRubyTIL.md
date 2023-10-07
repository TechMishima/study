# ToDo
クラス・構造体メニュー
<br>
https://paiza.jp/works/mondai/class_primer/problem_index?language_uid=ruby

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