# ToDo
HTML/CSS入門編の受講<br>
https://paiza.jp/works/html/primer

# TIL

## 1-1 Webページの仕組みを知ろう

HTML：Hyper Text Markup Languageの略で、Webページの内容と構成を指定します。

CSS：Cascading Style Sheetsの略で、Webページのスタイル(サイズ・色・フォント・レイアウトなど)を指定します。<br>
複数のCSSを組み合わせたり、複数のHTMLから共通のCSSを利用したりできます。

HTMLフレームワーク：あらかじめデザインされたHTML/CSSをセットにしたもの。<br>
CSSフレームワークと呼ばれることもあります。

Bootstrap：ツイッター社が開発した高機能なHTMLフレームワーク。<br>
Webページ用の便利な部品を多数装備。レスポンシブデザインに対応。

## 1-2 Webページを作ってみよう
### htmlタグ
```
<html></html>
```
はさまれた部分が、Webページになる

### hタグ
```
<h1></h1>
```
はさまれた部分が、見出しになる

## 1-3 テキストを表示してみよう
### brタグ
```
<br>
```
単独で使用するタグ。この位置で改行する。

### strongタグ
```
<strong></strong>
```
はさまれた部分を、強調する。

## 1-4 Bootstrapを使ってみよう

### html5のひな型
```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>Project Nyaan</title>
    </head>
    <body>
        <h1>吾輩は猫である。</h1>
    </body>
</html>
```

### bootstrapを使用
```
<!DOCTYPE html>
<html lang="ja">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Project Nyaan</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

  </head>

  <body>
    <h1>吾輩は猫である。</h1>
        <p class="lead"> 猫である </p>
        <a class="btn btn-primary" href="#"> ok </a>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  </body>

</html>
```

### ふかぼり用
https://www.tohoho-web.com/ex/bootstrap.html

## 3-1 画像とリンクを載せよう


### 画像の大きさ自動調節 ※bootstrap限定
```
<img class="img-responsive center-block"> src="[URL]">
```

### リンク
```
<a href="https://ja.wikipedia.org/wiki/%E5%A4%8F%E7%9B%AE%E6%BC%B1%E7%9F%B3" target="_blank">夏目漱石</a>
```

target属性は同じウィンドウで開くのか別ウィンドウで開くのか選択できる。<br>
_blankにすると別ウィンドウになる。

## 3-2 リストとナビゲーションバーを追加しよう

>・見出し<br>
h1、表題になる。<br>
h2、大見出しになる。<br>
h3、中見出しになる。<br>
h4、小見出しになる。<br>

```
・箇条書き
<ul>
<li>ねこ</li>
	<li>いぬ</li>
	<li>うさぎ</li>
</ul>
```

>ページ内で特定の場所に移りたい場合、aタグのhrefに#[id名]を設定すると、クリックするだけで遷移できる。<br>
#だけにするとトップ（一番上にうつる。）

### ナビゲーションバー ※ bootstrap限定

サンプル
```
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Project Nyaan</a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#list">List</a></li>
        <li><a href="">Table</a></li>
      </ul>
    </div>
  </div>
</nav>
```





<nav class="navbar navbar-inverse navbar-fixed-top">
        		<div class="container">
        			<div class="navbar-header">
        				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        					<span class="sr-only">Toggle navigation</span>
        					<span class="icon-bar"></span>
        					<span class="icon-bar"></span>
        					<span class="icon-bar"></span>
        				</button>
        				<a class="navbar-brand" href="#">Project Nyaan</a>
        			</div>
        			<div id="navbar" class="collapse navbar-collapse">
        				<ul class="nav navbar-nav">
        					<li class="active"><a href="#">Home</a></li>
        					<li><a href="#list">List</a></li>
        					<li><a href="">Table</a></li>
        				</ul>
        			</div>
        		</div>
        	</nav>