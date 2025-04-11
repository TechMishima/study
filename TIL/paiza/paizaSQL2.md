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

## 11-1 データ型

カラムに格納できるデータの型のこと。<br>
データの種類や大きさを指定することで、ただし計算や処理を行う為に必要である。

## 11-2 整数型

INTEGER : 整数型

- +21億～-21億の範囲の整数を使用できる。
- 2.5などの少数をいれると、四捨五入、切捨てした整数が入る。

※21億より大きい整数はどの型を使用するのか？<br>
BIGINTを使用する。

小さい範囲のTINYINT, SMALLINT, MEDIUMINTなどもある。

## 11-3 小数型

小数型には固定小数点型と浮動小数点型がある。<br>
どう違うのか？
- 浮動小数点型
  - 可変の小数点位置である。よって、広い範囲の数値を表現可能である。誤差が発生しやすい。
  - 機械学習、3Dグラフィックスなどのある程度の誤差が許容されている用途に使用される。

- 固定小数点型
  - 小数点の位置が固定である。よって、精度が高い。極端に大きい値や小さい値は扱えない不自由さがある。
  - 高精度なシステム、信号処理などの用途に使用される。

### 固定小数点型 DECIMAL 

DECIMAL(3, 1) : 全体で3桁、小数点以下は1桁を意味する。<br>
上記の場合だと99.9 ~ -99.9の間を設定できる。<br>
100以上のような設定以上の少数だとエラーになり、<br>
20.55のような小数点以下の設定以上の少数だと20.6に四捨五入される。

### 浮動小数点型

- FLOAT 4バイト<br>
厳格な精度が不要な浮動小数点型のデータ型。
- DOUBLE 8バイト<br>
精度が高い浮動小数点型。科学計算など高精度の計算が必要な時に使用される。

## 11-4 文字列型

固定長文字列型と可変長文字列型がある。

- 可変長文字列型 VARCHAR(20) : 最大文字数が20文字<br>
それ以上になると、エラーになる。

- 固定長文字列型 CHAR(5) : 常に文字列が5文字。足りない部分は空白で埋める。
  - 固定長データ(国コードなど)、商品コードなどの短い識別子に適している。

## 11-5 日付型

- DATE : 西暦1000～9999までしか入らない。<br>
もし範囲外の西暦であれば、文字列型など別の方を使用する。

## 11-6 日時型

日付だけではなく時間も入る型

- DATETIME : 西暦1000～9999までの日時しかはいらない。

- TIMESTAMP

### DATETIMEとTIMESTAMPの違いって？
> https://www.dbtech.digibeatrix.com/archives/274

取得時、保存時にUTC(協定世界時)を考慮した処理を行うのがTIMESTAMP

- DATETIME
  - 設定できる範囲が広い

- TIMESTAMP
  - 設定できる範囲が狭い。
  - UTC(協定世界時)を考慮、グローバルな環境でもずれが起きない。
  - アメリカのサマータイム（実在しない時間でエラーが起きる）にも対応できる。

## 11-7 デフォルト値を設定する

デフォルト値を設定すると、挿入時に値を設定しなかったら設定した値が自動的に入る。

```
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) DEFAULT 1000.00
);
```

## 12-1 制約

カラムに格納できる値を制限できる。

- 一意制約
  - 重複を制限することで区別することが可能になる。

- 参照制約
  - 外部キー制約を決めておくと、存在しないデータに結び付くケースがなくなる。

## 12-2 一意制約: カラム内の値の重複を禁止する (UNIQUE)

一意 : 重複しないという意味<br>
UNIQUEをつける。

```
CREATE TABLE user(
  user_id INTEGER,
  email VARCHAR(255) UNIQUE
);
```

※ NULLは重複してもOK

## 12-3 非NULL制約: カラムへのNULLの挿入を禁止する (NOT NULL)

```
CREATE TABLE user(
  user_id INTEGER,
  email VARCHAR(127) NOT NULL
);
```

### 追加学習
テーブルの削除
```
DROP TABLE user;
```

## 12-4 主キー制約: 主キーを設定する (PRIMARY KEY)

一意制約と非NULL制約を満たす

```
CREATE TABLE user(
  user_id INTEGER PRIMARY KEY
);
```

## 12-5 外部キー制約: 外部キーを設定する (FOREIGN KEY)

> FOREIGN KEY (外部キー制約を付与するカラム名)<br>
REFERENCES 参照先テーブル名(参照先テーブルの参照するカラム名)

```
CREATE TABLE thread(
  thread_id INT PRIMARY KEY,
  title VARCHAR(63) NOT NULL
);

CREATE TABLE post(
  thread_id INT,
  post_id INT PRIMARY KEY,
  content TEXT NOT NULL,
  FOREIGN KEY (thread_id) REFERENCES thread(thread_id)
);
```

## 13-1 日付同士の差を求める (TIMESTAMPDIFF)
MYSQL限定

```
SELECT customer_id, first_name, email, birthday, TIMESTAMPDIFF(YEAR, birthday, '2022-01-01')
FROM customer
LIMIT 10;
```
- 第１引数 : year 計算した期間をどんな形式にするか 
- 第２引数 : 引き算を行う対象
- 第３引数 : 引き算する数値

### 第１引数の種類について
> MySQLリファレンスより<br>
https://dev.mysql.com/doc/refman/8.0/ja/date-and-time-functions.html#function_timestampdiff

- MICROSECOND (マイクロ秒) ※5.1.24以前ではFRAC_SECOND
- SECOND 秒
- MINUTE 分
- HOUR 時
- DAY 日
- WEEK 週
- MONTH 月
- QUARTER 四半期
- YEAR 年

## 13-2 日時に対する加算
> カラム名 + INTERVAL 加算する間隔値 単位

```
UPDATE rental SET return_date_deadline = rental_date + INTERVAL 5 DAY;

SELECT rental_date, rental_date + INTERVAL 12 HOUR
FROM rental
LIMIT 10;

SELECT rental_date, rental_date + INTERVAL '1:30' HOUR_MINUTE
FROM rental
LIMIT 10;
```

### 単位と間隔値の書式

| 単位 | 間隔値の書式 | 記述例 |
| - | - | - |
|YEAR|年|3YEAR|
|MONTH|月|6YEAR|
|WEEK|週|3WEEK|
|DAY|日|5DAY|
|HOUR|時間|12HOUR|
|MINUTE|分|30MINUTE|
|SECOND|秒|45SECOND|
|YEAR_MONTH|年-月|1-6 YEAR_MONTH|
|DAY_HOUR|日 時間|1 12 DAY_HOUR|
|HOUR_MINUTE|時:分|1:30 HOUR_MINUTE|
|MINUTE_SECOND|分:秒|30:30 MINUTE_SECOND|

## 13-3 日時に対する減算

加算と同様であるが、マイナスにすればOK

```
SELECT rental_date, rental_date - INTERVAL 12 HOUR
FROM rental
LIMIT 10;
```

## 13-4 日時のフォーマットを変更する (DATE_FORMAT)

```
SELECT rental_id, DATE_FORMAT(rental_date, '%Y年 %C月 %e日  %k時 %i分')
FROM rental
LIMIT 5;
```

### フォーマット指定子

| フォーマット指定子 | 意味 | 例 |
| - | - | - |
|%Y|年(4けた)|2000|
|%y|年(2けた)|99|
|%m|月(2けた)|09|
|%c|月(1けたor2けた)|9, 10|
|%d|日(2けた)|09|
|%e|日(1けたor2けた)|9, 10|
|%H|時(2けた)|09|
|%k|時(1けたor2けた)|9, 10|
|%i|分(2けた)|09|
|%s|秒(2けた)|09|
|%W|曜日(英語表記)|Sunday|
|%w|曜日(※数値 0=日曜日, 1=月曜日)|0|

## 14-1 サブクエリとは

あるSELECT文の実行結果を他のSQL文に使用できる機能
```
SELECT *
FROM payment
WHERE amount >= (SELECT AVG(amount) FROM payment)
LIMIT 15;
```

## 14-2 サブクエリをWHERE句の中で使う

サブクエリに使用する場合は単一の値を返すようなSELECT文でなくてはいけない。

## 14-3 サブクエリをIN演算子と使う

IN演算子を使用したサブクエリに関しては複数の値を返すことは可能。<br>
しかし、複数のカラムに関しては扱えない。

```
SELECT *
FROM payment
WHERE customer_id IN (
  SELECT customer_id
  FROM customer
  WHERE DATE_FORMAT(birthday, '%m') = 1
)
LIMIT 15;
```

## 14-4 サブクエリをSELECT句の中で使う

SELECT句の中でサブクエリを使用するときは単一の値でなくてはならない。

```
SELECT customer_id,
  SUM(amount) AS 支払額,
  (SELECT SUM(amount) FROM payment) AS 総支払額,
  SUM(amount) / (SELECT SUM(amount) FROM payment) AS 割合
FROM payment
GROUP BY customer_id;
```

## 14-5 サブクエリをFROM句の中で使う

FROM句にサブクエリを使用する場合は、AS句も使用しなくてはならない。

```
SELECT AVG(支払額)
FROM (
  SELECT SUM(amount) AS 支払額
  FROM payment
  GROUP BY customer_id
) AS 顧客別支払額;
```

## 15-1 条件に応じて値を変える (CASE式)

> CASE<br>
  WHEN 条件1 THEN 値1<br>
  WHEN 条件2 THEN 値2<br>
  ・・・<br>
  ELSE 値1<br>
END

```
SELECT customer_id, SUM(amount) AS 支払額,
  CASE
    WHEN SUM(amount) >= 80 THEN '上級会員'
    WHEN SUM(amount) >= 40 THEN '中級会員'
    ELSE '通常会員'
  END AS 会員ランク
FROM payment
GROUP BY customer_id;
```

## 15-2 CASE式を用いた並び替え

```
SELECT *
FROM film
ORDER BY
  CASE
    WHEN rating = 'G' THEN 1
    WHEN rating = 'PG' THEN 2
    WHEN rating = 'PG-13' THEN 3
    WHEN rating = 'R' THEN 4
    WHEN rating = 'NC-17' THEN 5
    WHEN rating IS NULL THEN 6
  END
;
```

## 15-3 CASE式を用いた列持ちでの集計

```
SELECT
  SUM(CASE WHEN store_id = 1 THEN amount ELSE 0 END) AS 店舗1,
  SUM(CASE WHEN store_id = 2 THEN amount ELSE 0 END) AS 店舗2
FROM payment;
```

## 16-1 クロス集計表を作ってみよう

```
SELECT
  売上月,
  SUM(CASE WHEN store_id = 1 THEN amount ELSE 0 END) AS 店舗1,
  SUM(CASE WHEN store_id = 2 THEN amount ELSE 0 END) AS 店舗2
FROM (
  SELECT DATE_FORMAT(payment_date, '%Y-%m') AS 売上月, payment_id, store_id, amount
  FROM payment
) AS 売上
GROUP BY 売上月;
```

## 17-1 月ごとに集計する

```
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS 売上月, SUM(amount)
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m');
```

## 17-2 曜日ごとに集計する

演習１、演習２終了


## 新・SQL入門編02ドリル

注文履歴を取得しよう MySQL編
~
会員のリストを取得しよう MySQL編
~
漢字名、フリガナ、入会日、居住地を取得しよう MySQL編
~
合計金額の高い順に並べ替えよう MySQL編
~
入会した順に並べ替えよう MySQL編
~
注文番号、小計、メニュー番号についての条件で並べ替えよう MySQL編
~
価格の高い順に 10 件取得しよう

## 新・SQL入門編03ドリル

STEP: 1 日時を指定して取得しよう
~
バーガーを全種類取得しよう MySQL編
~
入会日を指定して取得しよう MySQL編
~
注文時刻を指定して取得しよう MySQL編
~
合計金額が 813 円に近い注文履歴を取得しよう MySQL編
~
居住地を指定して取得しよう MySQL編
~
12 時台の注文履歴を取得しよう MySQL編
~
複合的な条件を指定して取得しよう MySQL編
~
複合的な条件を指定して取得しよう
~
午前中の 1000 円以上の注文履歴を取得しよう
~
2 つのバーガーの注文内容を取得しよう MySQL編
~
条件を満たす注文番号を取得しよう MySQL編
~
謝罪先を調べよう MySQL編
~
ゲームの勝敗を調べよう MySQL編
~
同僚を助けよう MySQL編
~
同僚に協力しよう MySQL編
~
しりとりで勝つ MySQL編


## 新・SQL入門編04ドリル
https://paiza.jp/works/mondai/sql-new-primer-04_drill/problem_index?language_uid=sql

IDなしのメニュー表を作ろう MySQL編
~
応急メニュー表 MySQL編
~
ウルトラ注文履歴 MySQL編

