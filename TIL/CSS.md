# ToDo
プロパティの学習<br>
https://www.tagindex.com/stylesheet/properties/
<br>上記リンクを実際に動かしながら試す。

# TIL
## プロパティ
### font-sizeプロパティ
<br>フォントの大きさを指定できる
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
<br>文字の太さを指定できる
<br>100～900と9段階で太さを指定できることになっているが、実際は太字と標準のみ
<br>通常は400、太字は700と同等である
<br>※boldだけ使えれば問題はないのかもしれない。
```
.text {
  font-weight: bold;
}
```