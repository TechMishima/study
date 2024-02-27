# HTML
## CSSの組み込み
https://style.potepan.com/articles/20557.html#HTMLCSS2_HTMLCSS
1. 外部CSSの読み込み<br>
link rel="stylesheet" href="css/style.css"でcssを指定している。
```
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CSS Sample</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="div-css">外部CSSファイル読み込みのサンプルです。</div>
</body>
</html>
```
2. HTMLにstyleで直接定義<br>
bodyタグ内で記述する
```
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CSS Sample</title>
</head>
<body>
<div style="color: red;">HTMLタグに直接スタイルを定義したサンプルです。</div>
</body>
</html>
```
3. HTMLファイル内でCSSを定義<br>
headタグ内で記述する
```
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CSS Sample</title> 
  <!-- styleタグに記述していく -->
  <style> 
    .div-css {
      color: red;
    }
  </style>
</head>
<body>
<div class="div-css">HTMLファイルに直接スタイルを定義したサンプルです。</div>
</body>
</html>
```

## タグの種類
### プルダウンメニュー
```
<select name="example">
  <option>選択肢のサンプル1</option>
  <option>選択肢のサンプル2</option>
  <option>選択肢のサンプル3</option>
</select>
```

### テーブル
```
<!-- テーブル -->
<table border="1"><!-- テーブルの始め -->
  <tr><!-- 行の始め -->
    <th>ヘッダ1</th><!-- 見出し -->
    <th>ヘッダ2</th>
  </tr>
  <tr>
    <td>データ1-1</td><!-- データ -->
    <td>データ1-2</td>
  </tr>
  <tr>
    <td>データ2-1</td>
    <td>データ2-2</td>
  </tr>
</table>
```