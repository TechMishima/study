# ToDo
Flaskの学習<br>
https://paiza.jp/works/flask/primer/beginner-flask1

# TIL

## 1-1 Webアプリの初歩を理解しよう
初歩的なアプリを開発する<br>
python + flask

ルーティングとテンプレートエンジンを学ぶ<br>

<b>flaskとは</b><br>
軽量なフレームワークである。<br>
djangoと比べて軽い分析や機械学習に適している<br>

## 1-2 FlaskでHello World

### ターミナルコマンド
python -Vコマンド : 現在のpythonのバージョンを確認できるコマンド<br>
mkdir myapp : ディレクトリの作成ができる（ファイル名 myapp ※変更可）

### pythonフォルダの記述
```
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello World!"
```
flaskをインポート<br>
app = Flask(__ name__) : アプリケーションの名前を設定<br>
ルートURLを受け取った時にhello worldを出力するように記述している。<br>

### flaskのサーバー起動
```
FLASK_APP=hello.py FLASK_ENV=development flask run
```
developmentは開発環境の事。<br>
本番環境とテスト環境がある。セキュリティの問題やデバッグのしやすさがある。

### アドレスについて
```
http://localhost:5000/
```

## 1-3 ルーティングを理解しよう

### ルーティングについて
Webブラウザのリクエストに合わせて、呼び出すページやコードを切り替える<br>

<b>一連の流れ</b><br>
webブラウザからwebサーバーへリクエスト（URL）が送られてくる。<br>
受け取ったリクエストをwebサーバーが処理をする。<br>
HTMLファイル、CSSファイル、画像ファイル、JavaScriptなどをwebブラウザへ送信する。<br>
受け取ったデータを組み合わせて、ブラウザ上に表示される。

### ルートの追加
```
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello_world():
    return "Hello World!"

@app.route("/about")
def about():
    return "This is paiza"
```

## 1-4 テンプレートで表示しよう
### テンプレートエンジンとは
データとHTMLを組み合わせてWebページを生成する機能<br>
flaskのテンプレートエンジンはjinja2が使われている<br>
jinja2はpythonのウェブフレームワークであり、Djangoにも採用されている。

### テンプレートエンジンの呼び出し
```
from flask import Flask, render_template
app = Flask(__name__)

@app.route("/")
def hello_world():
    return render_template("index.html")

@app.route("/about")
def about():
    return "This is paiza"
```
from flask import Flask, render_template : render_templateをインポートする。<br>
return render_template("index.html") : テンプレートとしてindex.htmlを指定する。

### テンプレートの作成
ディレクトリの中に「templates」とディレクトリを作成する。<br>
templatesディレクトリの中にindex.htmlを作成する。<br>
index.htmlにレイアウトを記述していく。（例として下記を記述）
```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>Flask - paiza</title>
        <style>body {padding: 10px;}</style>
    </head>
    <body>
        <h1>Hello Python</h1>
        <p>Hello paiza!</p>
    </body>
</html>
```

## 1-5 テンプレートエンジンの書き方を理解しよう

### テンプレートにデータを渡す
pyフォルダからテンプレートにデータを渡すことができる。<br>
変数で名前を定義して、こんにちは○○さんと、適切に切り替えることが可能になる。

### コードの記述

```
from flask import Flask, render_template
app = Flask(__name__)

@app.route("/")
def hello_world():
    name = "Flask"
    return render_template("index.html", name_value = name)

@app.route("/about")
def about():
    return render_template("index.html")
```
name_value = nameを記述することで、テンプレートにデータを渡すことができる。<br>
name_valueがテンプレート側で使用できる変数になっている。

```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>Flask - paiza</title>
        <style>body {padding: 10px;}</style>
    </head>
    <body>
        {% if name_value %}
            <h1>Hello {{ name_value }}</h1>
        {% else %}
            <p>Hello paiza!</p>
        {% endif %}
    </body>
</html>
```
テンプレート側で使用するときは{{ }}2重波かっこを使用する。

jinja2を使用しているので、<% %>で囲ってあげると、pythonコードを使用することができる。<br>
pythonと記述が似ているが全く同じではないので注意


## 1-6 RPGの戦闘シーンを表現しよう

### ループ処理を行うテンプレート
```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="utf-8">
        <title>Flask - paiza</title>
        <style>body {padding: 10px;}</style>
    </head>
    <body>
        <h1>Hello {{ name_value }}</h1>
        <p>Hello paiza!</p>
        {% for player in players: %}
            <p>{{ player + "はモンスターと戦った" }}</p>
        {% endfor %}
    </body>
</html>
```
for inを使用することでループ処理を行うことができる。<br>
さらにpyからテンプレートへリストを送ることが可能。<br>
for inを使用するときはend forが必要である。<br>

## 1-7 テンプレートの共通部分を分割しよう

### Linux cpコマンド
```
cp templates/index.html templates/layout.html
```
ファイルをコピーすることができる。<br>
コピー先のディレクトリを指定することもできる。<br>
ディレクトリ先を指定しなかった場合は、現在いるディレクトリに保存される。<br>

おまけ https://qiita.com/web-hackers/items/08420eb57b1765fdc65d
|オプション|説明
|-|-
|-a|元ファイルの属性とディレクトリの構成を保持してコピーする。
|-b|上書きされるファイルのバックアップを作成する
|-d|シンボリックリンクをコピーする際に実体をコピーする
|-f|コピー先に同じ名前のファイルがある際に警告なしで上書きをする。
|-i|上書きされるファイルがある際に確認が入る。
|-l|ハードリンクを作成する
|-P|ディレクトリ構造ごとコピーする
|-p|元のファイルのオーナー、グループ、パーミション、タイムスタンプを保持
|-r|コピー元にディレクトリを指定した場合、再帰的に（サブディレクトリも含めて）コピーする
|-s|コピーの代わりにシンボリックリンクを作成する
|-u|保存先が同じファイル名のファイルだったとき、タイムスタンプを確認して、新しいor同じだったときコピーしない。
|-v|実行内容を表示

### 共通テンプレート
共通テンプレートの定義
```
<body>
    <p>共通テンプレート</p>
    {% block content %}
    {% endblock %}
</body>
```
共通テンプレートの呼び出し
```
{% extends "layout.html" %}
{% block content %}
    <h1>Hello {{ name_value }}</h1>
    <p>Hello paiza!</p>
    {% for player in players: %}
        <p>{{ player + "はモンスターと戦った" }}</p>
    {% endfor %}
{% endblock %}
```

## 1-8 RPGの行動選択メニューを作ろう その１

### HTMLのlinkタグとaタグの違いとは？
https://saruwakakun.com/html-css/basic/link-rel<br>

linkタグ : 訪問者に見えないようにしながら別ページとの関連付けをするタグ。<br>
head内に記述する。<br>
```
スタイルシートの読み込み
<link rel="stylesheet" href="スタイルシートのURL">

Webサイトのアイコン指定
<link rel="icon" href="画像のURL" sizes="32x32" />
<link rel="icon" href="画像のURL" sizes="192x192" />
<link rel="apple-touch-icon-precomposed" href="画像のURL" />
# "apple-touch-icon-precomposed"はスマホやタブレットでホーム画面にページを追加したときに使われる。150×150くらいのサイズのPNG画像を使用すると良い。
```
aタグ : 訪問者に見えるように記述する。リンクを踏ませるためのタグ。<br>
body内に記述する。<br>
```
<a href="指定したリンク先">リンク先</a>
```

## 1-9 RPGの行動選択メニューを作ろう その２
```
{% extends "layout.html" %}
{% block content %}
    <h1>{{ player }}のアクション</h1>
    <p>{{ message }}</p>
    <p><a href="/">メニューに戻る</a></p>
{% endblock %}
```
```
<a href="/">メニューに戻る</a>
```
上記のコードについて、リンクでルートを指定することでトップページに戻ることができる。

## 2-1 フォーム処理の基本を理解しよう
pythonで、フォーム処理の基本を身に着ける。<br>
データ転送にはgetメソッドとpostメソッドがある。<br>

### フォームメソッドのおさらい
```
<form method="POST" action="sample.cgi">
    <p>お名前：<input type="text" name="NAME"></p>
    <p>メールアドレス：<input type="text" name="email"></p>
    <p><input type="submit" value="送信する"></p>
    <p><input type="reset" value="取消する"></p>
</form>
```
<form method="POST" action="sample.cgi">
    <p>お名前：<input type="text" name="NAME"></p>
    <p>メールアドレス：<input type="text" name="email"></p>
    <p><input type="submit" value="送信する"></p>
    <p><input type="reset" value="取消する"></p>
</form>


https://html-coding.co.jp/annex/dictionary/html/form/<br>
formタグがひとつのフォームとなり、フォームの中にinputタグ、selectタグ、textareaタグなどのフォーム部品を配置してフォームをつくる。<br>
action属性が送信先アドレス、methodでhttpメソッドを指定する。

## 2-2 投稿フォームを作ろう
webブラウザからwebサーバーにリクエストを送信するときに、httpメソッドのgetメソッドやpostメソッドなどが使われる。<br>
getメソッド : 検索する時に使用される。urlに?や&などを加えて送信する。<br>
（例）http://example.net/form?article=hello&name=paiza<br>
上記だと検索フォームでarticleがhelloと、nameがpaizaで検索している。

postメソッド : フォームを送信するときに使用する。

## 2-3 投稿したデータを表示しよう

### formで送ったデータを表示する
```
<form action="/result" method="post">
    <label for="article">投稿</label>
    <input type="text" name="article">
    <p></p>
    <label for="name">名前</label>
    <input type="text" name="name">
    <button type="submit">送信する</button>
</form>
```
```
from flask import Flask, request, render_template
app = Flask(__name__)

@app.route("/")
def show():
    message = "Hello World"
    return render_template("form.html", message = message)

@app.route("/result", methods=["POST"])
def result():
    message = "This is paiza"
    article = request.form["article"]
    name = request.form["name"]
    return render_template("form.html", message = message, article = article, name = name)
```

インポートにrequestを追加する。<br>
ルーティングを設定する。フォームで/resultのpostメソッドを受け取った時に結果を表示するようにしている。<br>
request.form["キー"]で、受け取った値を変数に入れることができる。

## 2-4 getメソッドでフォームを作ろう

### postメソッドとgetメソッドの違いについて
どちらもフォームを送信して、画面に表示することはできる。<br>
get : urlに送信する情報が入っている。 他人から見られる可能性があるので、検索機能で使用される。<br>
post : urlに送信する情報が入っていないので、秘匿性のあるデータを送信するときに使用する。

### getメソッドにも対応できるコード
```
from flask import Flask, request, render_template
app = Flask(__name__)

@app.route("/")
def show():
    message = "Hello World"
    return render_template("form.html", message = message)

@app.route("/result", methods=["GET", "POST"])
def result():
    message = "This is paiza"
    if request.method == "POST":
        article = request.form["article"]
        name = request.form["name"]
    else:
        article = request.args.get("article")
        name = request.args.get("name")
    return render_template("form.html", message = message, article = article, name = name)
```

上記が完成
```
@app.route("/result", methods=["GET", "POST"])
```
メソッドにGETを追加する。
```
if request.method == "POST":
    article = request.form["article"]
    name = request.form["name"]
else:
    article = request.args.get("article")
    name = request.args.get("name")
return render_template("form.html", message = message, article = article, name = name)
```
if文はhttpメソッドでPOSTを受けたとき、elseはそれ以外なのでgetメソッドを受けたときになる。<br>
getメソッドで変数に入れるときは、request.args.get("name")と記入する。<br>
かっこがpostとgetで異なっているので注意する。

```
<form action="/result" method="get">
```
送信フォームを送る時は、メソッドをgetに変更するとルーティングを変更できる。

## 2-5 フォームでRPGの戦闘シーンを作ろう

### optionタグの valueについて
```
<option value="{{ player }}">{{ player }}</option>
```
プルダウンメニューに値を設定できる。<br>
値をman、表示を男性にするように、コードと可読性を分けている。

### valueをちょっとふかぼり
https://html-coding.co.jp/annex/dictionary/html/option/<br>
```
<form action="samplel.cgi" method="post">
  <p>性別<br>
    <select name="sex">
      <option value="man">男性</option>
      <option selected value="woman">女性</option>
      <option disabled value="monster">モンスター</option>
    </select>
  </p>
</form>
```
disabledで選択不可の状態にできる<br>
selectedですでに選択されている状態にできる

## 2-6 1行掲示板を作ろう 投稿したデータを表示する

### コードを読む テキストの読み込み
```
from flask import Flask, request, render_template
import codecs
app = Flask(__name__)

@app.route("/")
def bbs():
    message = "Hello world"
    file = codecs.open("articles.txt", "r", "utf-8")
    lines = file.readlines()
    file.close()
    return render_template("bbs.html", message = message)

@app.route("/result", methods=["POST"])
def result():
    message = "This is paiza"
    article = request.form["article"]
    name = request.form["name"]
    return render_template("bbs.html", message = message, article = article, name = name)
```

import codecs : コーデックスをインポート<br>

file = codecs.open("articles.txt", "r", "utf-8") : ファイルを開く<br>
かっこの中は、ファイル名, 読み込みモード, 文字コードの順番になっている。<br>

readlines変数を使用すると、1行ずつ読み込んで、変数に格納してくれる。

### コードを読む テーブル
```
<table>
<tr><th>投稿</th><th>名前</th></tr>
    {% for line in lines: %}
        {% set column = line.rstrip().split(",") %}
        <tr>
            {% for item in column: %}
                <td>{{ item }}</td>
            {% endfor %}
        </tr>
    {% endfor %}
</table>
```
setはforのような、繰り返し処理をしているときに変数の再定義をするときに使用される。<br>

<b>テーブルをふかぼり</b><br>
https://www.sejuku.net/blog/49377<br>
```
 <table border="1" bordercolor="red" bgcolor="yellow">
    <tr>
      <th>名前</th>
      <th>年齢</th>
    </tr>
    <tr>
      <td>田中</td>
      <td>27</td>
    </tr>
    <tr>
      <td>佐藤</td>
      <td>42</td>
    </tr>
  </table>
```
borderで、枠線を追加することができる。上記では太さが1<br>
bordercolerで、枠線の色を変えることができる<br>
bgcolorでテーブルの背景の色を変えることができる<br>

## 2-7 1行掲示板を作ろう 投稿をファイルに保存する

```
file = codecs.open("articles.txt", "a", "utf-8")
file.write(article + "," + name + "\n")
file.close()
```

aは書き込みモード。ファイルに追加で記述したい時にしようする。

<b>ちょっとふかぼり</b><br>
wのモードもある。既存の内容は上書きされてしまう。

## 3-1 pythonでデータベースに接続しよう

sqlを学習する。<br>
https://paiza.jp/works/sql/primer