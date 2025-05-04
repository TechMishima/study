# Do
02:CSSの色指定を理解しよう
https://paiza.jp/works/html/primer/beginner-html2/11011<br>

# TIL

## 光の三原色
赤、緑、青を混ぜて色を表す方法。<br>
全部混ぜると白、混ぜないと黒になる。<br>
RGBカラーモデルと言われる。<br>
欲しい色のRGBを表現できるサイトもある。<br>

## RGBの表記
16進数で表記される。<br>
0 1 2 3 4 5 6 7 8 9 A B C D E F<br>
```
#FF8000
```
上記の#は16進数で色を指定するという意味。

## 枠線
```
h1 {
  border: solid #00A0A0;
}
```

## 内側に余白をつける
```
body {
  padding: 100px;
}
```

## 外側に余白をつける
```
h1 {
  margin: 80px;
}
```

## レスポンシブデザイン
bootstrap限定
```
<div class="container">
  <div>
    <h1>吾輩は猫である。</h1>
    <p class="lead">名前はまだない。</p>
    <a class="btn btn-primary" href="#">OK</a>
  </div>
</div>
```

## スターターテンプレート
```
<style>
  .starter-template {
    padding: 40px 15px;
    background-color: white;
  }
</style>

<body>
  <div class="starter-template">
    <div>
      <h1>吾輩は猫である。</h1>
      <p class="lead">名前はまだない。</p>
      <a class="btn btn-primary" href="#">OK</a>
    </div>
  </div>
</body>
```

## グリッドシステム
bootstrap限定<br>
grid : マス目<br>
col-sm-4の場所を変えると列の幅を変えられる。<br>
合計12になるように設定する。
```
<div class="container">
  <div class="row">
    <div class="col-sm-12">
      <h1>1行目</h1>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-4">
      <h2>2行目のA</h2>
    </div>
    <div class="col-sm-4">
      <h2>2行目のB</h2>
    </div>
    <div class="col-sm-4">
      <h2>2行目のC</h2>
    </div>
  </div>
</div>
<!-- /.container -->
```

## ジャンボトロン
文字を大きく表示する。
```
<div class="jumbotron>
```

## 画像の大きさ自動調節 ※bootstrap限定
```
<img class="img-responsive center-block"> src="[URL]">
```