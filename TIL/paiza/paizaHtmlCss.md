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

### 見た目の貢献しないのにnavはなぜ使うのか？

- SEOに影響する。
  - SEOとは、「検索エンジンで自分のサイトやページを上位に表示させるための工夫や技術」
  - 検索結果で上位表示されるようになる。
- 機能性の独立性
  - スクリプトやスタイルを個別に当てやすい

### 特定の場所だけCSSを適用 span

```
<p>これは <span class="highlight">目立たせたい部分</span> です。</p>
```

### bootstrap限定 トップにナビゲーションバーを作成
このボタンは、画面が狭いとき（スマホ・タブレットなど）にメニューを折りたたみ表示し、タップ/クリックで開閉できるようにする「トグルボタン（≒ハンバーガーメニュー）」。
```
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
  <span class="sr-only">Toggle navigation</span>
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
</button>
```
| 属性/クラス | 意味 |
| --------------------------------- | ------------------------------------------------------ |
| `type="button"`  | 通常のボタンとして動作（フォーム送信しない） |
| `class="navbar-toggle collapsed"` | Bootstrapのクラスで、折りたたみナビ用ボタンをスタイル（collapsedは折りたたまれている状態） |
| `data-toggle="collapse"`  | BootstrapのJSに「折りたたみをトグルしろ」と伝える |
| `data-target="#navbar"` | どの要素を開閉対象にするか（ここでは `id="navbar"` を指定） |
| `aria-expanded="false"`  | アクセシビリティ：今は「開いていない」ことを示す |
| `aria-controls="navbar"` | アクセシビリティ：制御対象が `#navbar` であることを示す |

```
<span class="sr-only">Toggle navigation</span>
```
スクリーンリーダー専用のテキスト。<br>
画面には表示されないが、「何のボタンか」伝えるために読み上げられる。

```
<span class="icon-bar"></span>
```
視覚的に「3本線のハンバーガーメニュー」を表示するための要素。<br>
BootstrapのCSSがこれらを横線にスタイリングして、「≡」のようなボタンに見せる。

## 3-3 テーブルを表示しよう

テーブルの基本形(表題込み)
```
<table>
	<thead><!-- ここが表題-->
		<tr><!-- 横一行ごとに記述する-->
			<th>#</th>
			<th>名前</th>
			<th>特徴</th>
			<th>住所</th>
		</tr>
	</thead>
	<tbody><!-- ここが表の本体-->
		<tr><!-- 横一行ごとに記述する-->
			<td>1</td>
			<td>たま</td>
			<td>くつ下</td>
			<td>東京都港区南青山</td>
		</tr>
	</tbody>
</table>
```

bootstrap限定 テーブルの装飾
```
<table class="table table-striped">
```

## 3-4 基本的なフォームを作ろう

フォームの基本形
```
<form action="#" method="post">
    <label for="comment_1">コメント</label>
    <input type="text" name="comment">
	<button type="submit">送信する</button>
</form>
```

Bootstrapのフォーム基本形
```
<form action="#" method="post">
	<div class="form-group">
		<label for="comment_1">コメント</label>
		<input type="text" class="form-control" name="comment" id="comment_1">
	</div>
	<button type="submit">OK</button>
</form>
```

## 3-5 フォームにパーツを追加しよう

複数行のテキストエリアの基本形
```
<form action="#" method="post">
	<label for="message">メッセージ</label>
	<textarea name="message" id="message" rows="3"></textarea>
	<button type="submit">送信する</button>
</form>
```

Bootstrapの複数行のテキストエリアの基本形
```
<form action="#" method="post">
	<div class="form-group">
		<label for="message">メッセージ</label>
		<textarea class="form-control" name="message" id="message" rows="3"></textarea>
	</div>
	<button type="submit">送信する</button>
</form>
```

プルダウンメニューの基本形
```
<form action="#" method="post">
	<select name="select" id="select">
		<option>タマ</option>
		<option>ミケ</option>
		<option>トラ</option>
	</select>
</form>
```

Bootstrapのプルダウンメニューの基本形
```
<form action="#" method="post">
	<div class="form-group">
		<select class="form-control" name="select" id="select">
			<option>タマ</option>
			<option>ミケ</option>
			<option>トラ</option>
		</select>
	</div>
</form>
```

textareaの学習