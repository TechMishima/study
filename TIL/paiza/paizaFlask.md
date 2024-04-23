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

