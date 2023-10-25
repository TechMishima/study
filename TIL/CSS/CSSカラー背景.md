# TIL
## プロパティ
### colorプロパティ
文字色の指定
```
.text {
  color: #ff0000;
}
```

### background-colorプロパティ
背景色の指定
```
.text {
  background-color: #ffffff;
}
```

### background-imageプロパティ
背景画像
```
.text {
  background-image: url("images/test.png");
}
```

### background-repeatプロパティ
背景画像の並び方の指定<br>
background-imageプロパティと使用する。
```
.text {
  background-image: url("images/test.png");

  background-repeat: repeat-x; /* 水平方向に並べる */
  background-repeat: repeat-y; /* 垂直方向に並べる */
  background-repeat: no-repeat; /* 一つだけ表示する */
}
```

### background-positionプロパティ
背景画像の表示位置を指定する。<br>
background-imageプロパティと使用する。
```
.text {
  background-image: url("images/test.png");

  background-position: left top; /* 左 上 */
  background-position: center center; /* 中央 */
  background-position: right bottom; /* 右 下 */
}
```

### background-attachmentプロパティ
背景画像の固定表示を指定する。<br>
background-imageプロパティと使用する。
```
.text {
  background-image: url("images/test.png");

  background-attachment: fixed;
}
```