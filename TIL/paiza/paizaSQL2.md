# ToDo
新・SQL入門編の受講<br>
https://paiza.jp/works/sql/new-primer

# TIL

## 1-1 データベースとは

### DB用語
- データベース(DB)
  - 大量のデータを効率よく取り出せるように加工されたデータの集まり

- データベースマネジメントシステム(DBMS)
  - データベースを管理するためのソフトウェア

- リレーショナルデータベースマネジメントシステム(RDBMS)
  - リレーショナルデータベースを管理するためのソフトウェア

### データベースの種類

- リレーショナルデータベース
- key-valueストア
- ドキュメントデータベース
- グラフデータベース

### リレーショナルデータベースの構成要素

- テーブル
  - データを行と列で構成された形式で格納する、リレーショナルデータベースの基本単位
- レコード
  - テーブル内の1行分のデータ
- カラム
  - テーブル内の1列。データの属性や項目を定義
- フィールド
  - レコードとカラムが交差する個々のデータの単位

## 1-2 SQLとは

### 復習

SQL : データベースに対して操作を行うために使用する問い合わせ言語

- 様々なSQL文について
  - SELECT文
  - INSERT文
  - UPDATE文
  - DELETE文
  - CREATE文

## 1-3 MySQLへの接続と切断
paizaの使用方法の復習
```
接続
mysql -u root

切断
exit
```

## 1-4 データベースの準備

sqlファイルの実行
```
source /home/ubuntu/bookstore-schema.sql
```

### sakilaって？

Mysqlにあるサンプルデータベースのこと。<br>
https://dev.mysql.com/doc/sakila/en/

## 1-5 使用するデータベースを選択する (USEコマンド)

### mysqlに格納されているデータベース一覧を見る
```
show databases;
```

### useコマンドはどのデータベースを参照するのか決められるコマンド

useコマンドを使用しない場合
```
データベースを選択しない取得できない
mysql> SELECT * FROM customer;
ERROR 1046 (3D000): No database selected

useコマンドをしない時は、テーブル名の前にデータベース名を入れる
mysql> SELECT * FROM sakila.customer;
```

useコマンドを使用する場合

```
USEコマンドを使用する。
mysql> USE sakila;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

データベース名を入れなくても使用できる。(切断したら再度設定しないといけない)
mysql> SELECT * FROM customer;
```

## 1-6 サンプルデータベースについて

### sakilaについて
レンタルDVDショップの業務システムを想定したサンプルデータベースである。

## 2-1 レコードを取得する (SELECT句, FROM句)

### 復習
- SELECT : どのカラムから
- FROM : どのテーブルから

```
SELECT * FROM customer;
```

## 2-2 取得するカラムを絞り込む

### 復習
カラム名の指定の仕方
```
SELECT customer_id, first_name, last_name FROM customer;
```

## 2-3 NULLの捉え方

NULLとはデータが入っていないことを表している。<br>
システムによっては、空の文字列に関してもNULLとして扱われる可能性がある。