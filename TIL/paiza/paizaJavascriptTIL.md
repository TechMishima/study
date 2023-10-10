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

### 計算の優先順位
高い ( )<br>
｜ * / %<br>
低い + -
```
"西暦" + 2000 + 5 + "年"
=>西暦20005年
```
上記になる理由は先に”西暦+2000”の計算が行われるため、2000が文字列として扱われるため。

### Math.floor

指定された数値以下の最大の整数を表す。
```
console.log(Math.floor(5.95));
// Expected output: 5

console.log(Math.floor(5.05));
// Expected output: 5

console.log(Math.floor(5));
// Expected output: 5

console.log(Math.floor(-5.05));
// Expected output: -6
```

### 日付と時間
```
//今日の日付データを変数hidukeに格納
var hiduke=new Date(); 

//年・月・日・曜日を取得する
var year = hiduke.getFullYear();
var month = hiduke.getMonth()+1;
var week = hiduke.getDay();
var day = hiduke.getDate();

var yobi= new Array("日","月","火","水","木","金","土");

console.log("西暦"+year+"年"+month+"月"+day+"日 "+yobi[week]+"曜日");
```
- new Date()・・・現在の日付＆時刻の取得
- .getFullYear()・・・4桁の西暦年を取得
- .getMonth()・・・月を取得します。<b>値は実際より1つ少ない数</b>
- .getDay()・・・曜日を取得します。日曜日が0で、月曜が1，…,土曜が6
- .getDate()・・・日にちを取得
```
//時刻データを取得して変数jikanに格納する
var jikan= new Date();

//時・分・秒を取得する
var hour = jikan.getHours();
var minute = jikan.getMinutes();
var second = jikan.getSeconds();

console.log(hour+"時",+minute+"分"+second+"秒");
```
- .getHours()・・・時刻データの中から時間を取得
- .getMinutes()・・・時刻データの中から分を取得
- .getSeconds()・・・時刻データの中から秒を取得

### インクリメント・デクリメントとは？
インクリメントとは、プログラミング関係の用語で、<br>
変数の値を1増やす演算の事である。
逆に、1減らす演算の事をデクリメントと呼ぶ。
```
count = count + 1
count += 1
count++
```

### 配列
配列に要素を追加
```
team[team.length] = "商人";
team.push("狩人");
```
配列の要素数
```
console.log(team.length);
```

### 繰り返し処理
- for
```
for (var index = 0; index < team.length; index++) {
  console.log(team[index]);
}
```

- for in (インデックスの取得)
<br>配列に存在するすべてのインデックスを取得できる
<br>必ずしも0から順番に取得できるとは限らない(順番が重要ならば使わないほうが良い)
```
for (var index in team) {
  console.log(team[index]);
}
```

- for of (要素の取得)
<br>配列の要素をすべて取得できる
<br>ECMA Scriptが使える環境でのみ可能
```
for (var value of team) {
  console.log(value);
}
```
- ECMAScript(エクマスクリプト)
<br>ECMAScriptとは、国際的な標準化団体が策定しているJavaScriptの標準規格。
<br>当時普及していた、Netscape 社の「Netscape Navigator」というブラウザと、
Microsoft 社の「Internet Explorer」のどちらでも使用できるようにした規格。
https://blog.isystk.com/contents/js-school/2067/

- forEach(要素を昇順に取得)
```
team.forEach(value => {
    console.log(value);
})
```

### 文字列の分割 split
「,」の部分で分けて配列として格納する。
```
var values = input_string.split(",");
```