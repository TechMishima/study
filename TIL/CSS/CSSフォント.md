# TIL
## プロパティ
### font-sizeプロパティ
フォントの大きさを指定できる
```
.text {
  /* 自由に指定 */
  font-size: 16px;
  font-size: 80%;
  font-size: 5vh;
  /* 絶対サイズ */
  font-size: xx-small;
  font-size: x-small;
  font-size: small;
  font-size: medium;
  font-size: large;
  font-size: x-large;
  font-size: xx-large;
  /* 相対サイズ (親要素に依存) */
  font-size: smaller;
  font-size: larger;
}
```

### font-weightプロパティ
文字の太さを指定できる
<br>100～900と9段階で太さを指定できることになっているが、実際は太字と標準のみ
<br>通常は400、太字は700と同等である
<br>※boldだけ使えれば問題はないのかもしれない。
```
.text {
  font-weight: bold;
}
```

### font-styleプロパティ
斜体にすることができる
```
.text {
  font-style: oblique; /* 斜体 */
  font-style: italic; /* イタリック体 */
}
```

### font-familyプロパティ
フォントを指定することができる
<br>https://w3g.jp/sample/css/font-family
```
.text {
  font-family: "ＭＳ Ｐゴシック",sans-serif; /* ゴシック体 */
  font-family: serif; /* 明朝体 */
  font-family: cursive; /* 筆記体 */
  font-family: fantasy; /* 装飾体 */
  font-family: monospace; /* 等幅体 */
}
```
※指定したフォントで表示できない場合に備え、候補を設定しておく
<br>候補リストの最後には総称ファミリ名を指定しておく(上記5種のいずれか)
```
font-family: 候補1,候補2,候補3;
```

### font-variantプロパティ
スモールキャピタルを指定することができる
<br>小文字も大文字にすることが出来る。その際の大きさは少し小さくなる。
```
.text {
  font-variant: small-caps;
}
```

### text-alignプロパティ
水平方向の揃え方の指定
```
.text {
  text-align: center;
  text-align: left;
  text-align: right;
}
```

### line-heightプロパティ
行の高さを指定
```
.text {
  line-height: 200px;
}
```

### text-decorationプロパティ
文字の罫線を指定
```
.text {
  text-decoration: none; /* 装飾なし */
  text-decoration: underline; /* 下線を引く */
  text-decoration: overline; /* 上線を引く */
  text-decoration: line-through; /* 取り消し線を引く */
}
```

### text-indentプロパティ
頭の字下げを行う
```
.text {
  text-indent: 1em;
}
```

### text-transformプロパティ
大文字と小文字の変換
```
.text {
  text-transform: none;
  text-transform: capitalize; /* 先頭文字を大文字に変換 */
  text-transform: uppercase; /* 全ての文字を大文字に変換 */
  text-transform: lowercase; /* 全ての文字を小文字に変換 */
}
```

### letter-spacingプロパティ
文字の間隔の指定
<br>負の値を設定することで、間隔を詰めることができる。
```
.text {
  letter-spacing: 0.5em;
}
```

### word-spacingプロパティ
単語の間隔の指定
```
.text {
  word-spacing: 1em;
}
```