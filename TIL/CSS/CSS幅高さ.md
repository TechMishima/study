# TIL
## プロパティ
### widthプロパティ
内容領域の幅を指定
```
.text {
  width: 80%;
}
```

### heightプロパティ
内容領域の高さを指定
```
.text {
  height: 300px;
}
```

### max-widthプロパティ max-heightプロパティ
内容領域の最大を指定
```
.text {
  max-width: 500px;
  max-height: 500px;
}
```

### max-widthプロパティ max-heightプロパティ
内容領域の最小を指定
```
.text {
  min-width: 500px;
  min-height: 500px;
}
```

## 単位について
### 参考URL
https://web-camp.io/magazine/archives/102647

### 早見表
| 単位 | 絶対相対 | 対象 | 親要素 | 補足 |
| - | - | - | - | - |
| px | 絶対値 | - | - | - |
| % | 相対値 | ブロック要素 | 親要素 | 扱いやすい単位 |
| vh,vw | 相対値 | ブロック要素 | ビューポート | - |
| em | 相対値 | 文字 | 親要素 | letter-spacingなどの文字に対するプロパティに使用する |
| rem | 相対値 | 文字 | htmlタグ | デフォルトは16px |