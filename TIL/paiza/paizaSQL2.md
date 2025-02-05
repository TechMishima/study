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

## 2-4 レコードを並び替える (ORDER BY句)

昇順
```
SELECT * FROM film ORDER BY release_year ;
```

降順
```
SELECT * FROM film ORDER BY release_year DESC;
```

複数の並び替え
```
SELECT * FROM film ORDER BY release_year DESC, title;
```

## 2-5 取得する行数を決める (LIMIT句)

limit句は使用するRDBMSによってかわってくる。<br>

mysql,postgreSQL
```
SELECT * FROM book ORDER BY price DESC LIMIT 30
```

SQLserver
```
TOP句で取得する行数を指定する
SELECT TOP 10 * FROM film ORDER BY length DESC;
```

Oracle
```
FETCH FIRST節で取得する行数を指定する
SELECT * FROM film ORDER BY length DESC FETCH FIRST 10 ROWS 

ROWNUM疑似列で取得する行数を指定する
SELECT  FROM (SELECT  FROM film ORDER BY length DESC) WHERE ROWNUM <= 10;
```

## 2-6 コーディングスタイル, コメント

SELECTなどのSQL文をを小文字にして実行しても、問題はない。<br>
しかし、可読性の面を考えて、大文字で入力することが一般的になっている。

## 3-1 条件を付けてレコードを取得する (WHERE句)

```
SELECT *
FROM film
WHERE release_year = 2005;
```

## 3-2 比較演算子と IS NULL 演算子、IS NOT NULL 演算子
```
= : 両辺が等しい
> : より大きい
>= : 以上
< : より小さい
<= : 以下
<> : 両辺が異なる
```
=と<>が特殊なので間違えないようにする。

```
SELECT *
FROM film
WEHRE first_name = 'takeshi'
```
シングルコーテーションをつけることにより、カラム名ではなく値を参照できる。

```
SELECT *
FROM film
WEHRE first_name is NULL
```

= NULLではないので注意、 nullではない場合は IS NOT NULL と記述する。

## 3-3 BETWEEN 演算子

A以上B以下の演算子

```
SELECT *
WHERE
  length BETWEEN 85 AND 95;
```

## 3-4 論理演算子

否定演算子NOT

```
SELECT *
FROM film
WHERE
  NOT (rating = 'NC-17' OR rating IS NULL);
```

## 3-5 値の集合に含まれるかどうかを調べる (IN演算子)

カラムの値が値の集合に含まれるかどうかを調べる

```
SELECT *
FROM customer
WHERE
  first_name IN ('JESSIE', 'KELLY', 'TIM');
```

## 3-6 文字列が含まれるかどうかを調べる (LIKE演算子)

前方一致

```
SELECT *
FROM film
WHERE
  title LIKE 'GOLD%';
```

> % : ワイルドカード ・・・ 0文字以上の任意の文字(無くても良い)

部分一致

```
SELECT *
FROM film
WHERE
  title LIKE '%GOLD%';
```

後方一致

```
SELECT *
FROM film
WHERE
  title LIKE '%ING';
```

## 4-1 テーブルの結合

- 結合
  - リレーションを使って、複数のテーブルから1つのテーブルを作ること
- 結合方法
  - 内部結合
  - 外部結合(左外部結合、右外部結合)

## 4-2 内部結合 (INNER JOIN)

INNER JOIN (テーブル名) ON (結合条件)

```
SELECT *
FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id;
```

内部結合 : お互いのカラムの値について、存在しないかNULLの場合は、結合されない。

## 4-3 外部結合 (LEFT OUTER JOIN, RIGHT OUTER JOIN)

左外部結合

SELECT カラム名 FROM テーブル名<br>
LEFT OUTER JOIN テーブル名 ON 結合条件;

```
SELECT *
FROM film
LEFT OUTER JOIN category
  ON film.category_id = category.category_id;
```

右外部結合

SELECT カラム名 FROM テーブル名<br>
RIGHT OUTER JOIN テーブル名 ON 結合条件;

```
SELECT *
FROM category
RIGHT OUTER JOIN film
  ON film.category_id = category.category_id;
```

よく使われるのは左外部結合。<br>
右外部結合はオプション程度。

### ※ 追加学習

> LEFT JOIN と LEFT OUTER JOINは同じ挙動になる。<br>
・ LEFT JOIN : 簡略した記述<br>
・ LEFT OUTER JOIN : 可読性が高い記述

> 左外部結合の左テーブルってどこが基準になるのか？<br>
FROMの後に記述されているテーブル名が参照される。<br>
下記だとfilmになる。<br>
<br>
SELECT *<br>
FROM film<br>
LEFT OUTER JOIN category<br>
  ON category.category_id = film.category_id;<br>

## 4-4 3つ以上のテーブルの結合

続けてテーブルをつなげることができる。<br>
下記はｱｽﾀﾘｽｸだが、全部の情報を取得すると多くのカラムを取得してしまうので注意。
```
SELECT *
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
LEFT OUTER JOIN category ON film.category_id = category.category_id;
```

## 5-1 レコードをグループ化する (GROUP BY句)

### 用語
- 集約キー : グループ化するにあたり、対象となる値の事。
- 集約関数 : 複数のレコードから一つの値を返す関数のこと。<br>
  最大値や最小値、合計値や平均値を求めることができる。

SELECT句に書ける要素は、（集約キー、集約関数、定数）の3種類だけ。<br>
他のカラムを記述するとエラーになる。

### COUNT関数 : レコード数を数える

```
SELECT customer_id, COUNT(*)
FROM payment
GROUP BY customer_id
LIMIT 10;
```

## 5-2 合計を求める (SUM())

```
全ての合計
SELECT SUM(amount)
FROM payment;

グループ化して合計を求める
SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id;
```

## 5-3 平均を求める (AVG())

```
全ての平均
SELECT AVG(length)
FROM film;

グループ化して平均を求める
SELECT category_id, AVG(length)
FROM film
GROUP BY category_id;
```

## 5-4 最小値と最大値を求める (MIN(), MAX())

最小値,最大値
```
全ての最小値、最大値
SELECT MIN(length), MAX(length)
FROM film;

グループ化して最小値、最大値を求める
SELECT category_id, MIN(length), MAX(length)
FROM film
GROUP BY category_id;
```

## 5-5 カラムに名前を付ける (AS句)

```
SELECT customer_id, SUM(amount) AS 支払い金額
FROM payment
GROUP BY customer_id
LIMIT 10;
```

## 5-6 結果を絞り込む (HAVING句)

集約関数にWHERE句は使用できない。<br>
SUM(amount) >= 90 などの条件をつけるときは、<br>
HAVING句を使用することで集約関数の結果を絞り込むことができる。<br>

- WHERE句 : グループ化する前に絞り込みを行う。
- HAVING句 : グループ化した後に絞り込みを行う。

```
SELECT customer_id, SUM(amount)
FROM payment
WHERE payment_date BETWEEN '2005-07-01' AND '2005-07-31'
GROUP BY customer_id
HAVING SUM(amount) >= 40;
```

## 6-1 レコードを追加する

>> INSERT INTO テーブル名(カラム名1, カラム名2, ・・・・・)<br>
VALUES (値1, 値2, ・・・・・);

```
INSERT INTO staff(staff_id, first_name, last_name, username)
VALUES (3, 'Kyoko', 'Kirishima', 'Kyoko');

-- 全ての情報が入っているならカラム名を省略しても大丈夫
INSERT INTO staff
VALUES (3, 'Kyoko', 'Kirishima', 'Kyoko');

-- オートインクリメントしてくれるカラムなら省略しても大丈夫
INSERT INTO staff(first_name, last_name, username)
VALUES ('Kyoko', 'Kirishima', 'Kyoko');
```

## 6-2 複数レコードを一度に追加する

```
INSERT INTO film(title, category_id, release_year)
VALUES ('ぱいじょ！ THE MOVIE', 2, 2018),
('ぱいじょ！ THE MOVIE 2', 2, 2019),
('ぱいじょ！ THE MOVIE 3', 2, 2020);

Oracle Databaseの場合
INSERT ALL
INTO テーブル名 (カラム1, カラム2, ...) VALUES (値1, 値2, ...)
INTO テーブル名 (カラム1, カラム2, ...) VALUES (値1, 値2, ...)
SELECT * FROM DUAL;
```

## 7-1 フィールドの値を更新する

>>UPDATE テーブル名 SET カラム名1 = 値1, カラム名2 = 値2, ・・・・・<br>
WHERE 更新対象のレコードを絞り込む条件;

```
UPDATE staff SET username = 'Margaret'
WHERE staff_id = 3;
```

## 7-2 フィールドの値を増減させる

```
UPDATE film SET price = price + 0.5
WHERE title LIKE 'ぱいじょ%';
```

## 7-3 UPDATE文の注意点

WHEREの更新対象の絞り込みをしなかった場合、全てのレコードを対象に変更されてしまう。

### 自分なりに考えた対処法
WHEREをつけた後は空白だとエラーになるため、<br>
UPDATE句を使用するときはWHEREも同時に使用できるように、<br>
コピーする範囲を一緒にするか、UPDATE+WHEREの意識を持つことが重要だと考えるべき。

## 8-1 レコードを削除する (DELETE文)

>>DELETE FROM テーブル名<br>
WHERE 削除するレコードの条件;

```
DELETE FROM staff
WHERE  staff_id = 5;
```

## 8-2 すべてのレコードを削除する (DELETE文, TRUNCATE文)

2つの方法がある。<br>
処理速度はTRUNCATEの方が早い。<br>
なぜか？テーブルを丸ごと削除したのちに新しいテーブルを作成する2ステップしかないため。

```
DELETE FROM payment
```

```
TRUNCATE TABLE payment;
```

## 9-1 データベースを作成する (CREATE DATABASE文)

```
データベースの作成
CREATE DATABASE practice;
```

```
データベースの確認方法
SHOW databases;
```

## 10-1 テーブルを作成する (CREATE TABLE文)

>>CREATE TABLE テーブル名(<br>
  カラム名1 データ型 [制約],<br>
  カラム名1 データ型 [制約],<br>
  ...<br>
);

```
CREATE TABLE diary(
  id INTEGER PRIMARY KEY,
  published_on DATE UNIQUE NOT NULL,
  title VARCHAR(31) NOT NULL,
  temperature DECIMAL(3, 1),
  content TEXT
);
```

### データ型

- INTEGER : 整数
- DATE : 日付
- VARCHAR(31) : 文字列
- TEXT : 文字列(文章)
- DECIMAL(3, 1) : 小数

### 制約

- PRIMARY KEY : 重複とNULLを禁止
- UNIQUE : 重複したデータの禁止
- NOT NULL : NULLを禁止

PRIMARY KEYはテーブルに1つだけしか設定できない！ <br>
もしも上記と同じ制約をテーブルで複数設定するなら UNIQUE + NOT NULLをしようする！