## ToDo
https://paiza.jp/works/js/primer
## TIL
### Bootstrapとは？
- CSSフレームワークの一つである。
- 簡単に使用することができ、スマホ対応のWebページを作成することができる。
- HTMLにコードを入力するだけで使えるので、準備が簡単である。<br>

__参照URL__
https://www.sejuku.net/blog/81688

### JavaScriptについて
スクリプト言語である・・・可読性が高く比較的簡単に書きやすい言語の総称

### HTMLとして出力する方法
```
console.log("<h1><b>モンスター</b>があらわれた</h1>");
```
改行したくない場合は
```
process.stdout.write("<h1><b>モンスター</b>があらわれた</h1>");
```

### ランダムの数値の出力について
- Math.random関数
<br>0以上1未満の数値を出力する。
- parseInt関数
<br>
1 数値を小数点以下切捨て整数にして戻り値にする。
<br>2 文字列のして扱われている数字を数値として戻り値にする。
- 上記2点を使用したアルゴリズム
<br>（1～6の範囲でランダムの数値を出力する）
<br>*6・・・6の範囲
<br>+1・・・1から始まる 
```
var number = parseInt(Math.random() * 6) + 1;
```