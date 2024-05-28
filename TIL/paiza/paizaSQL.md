# ToDo
SQL入門の受講<br>
https://paiza.jp/works/sql/primer

# TIL

## 1-1 データベースを知ろう

### データベースの役割
大量のデータを保管し、効率よく取り扱うツール。<br>
・データ管理の共通機能を提供<br>
・データを操作（追加・選択・更新・削除）<br>

### データベースの構成要素
・テーブル : データを表で管理したもの。<br>
・行、レコード : テーブルの一つのデータ。<br>
・カラム、列、フィールド : データの項目の名前。<br>
・リレーション : テーブル同士の関連付け。<br>
・SQL(問い合わせ言語) : データベースを操作するための言語。

### 代表的なリレーショナルデータベースシステム
- MySQL
- SQLite
- PostgreSQL
- Oracle Database
- Microsoft SQL Server

## 1-2 データベースを準備しよう
phpMyAdminの使い方<br>
http://www.dbonline.jp/phpmyadmin/

## 1-3 テーブルの中身を見てみよう

### SQL文の構造
```
-- 全てのデータを取り出す
SELECT * FROM players;
```
- SELECT : 命令を表す部分。今回はデータを取り出す命令。<br>
- *(ｱｽﾀﾘｽｸ) : 対象にするカラムを指定する部分。今回は全てのカラムに対して実行する。<br>
- FROM : 対象にするテーブルを指定する部分。<br>
- players : FROMの後に続いているので、今回はplayersテーブルを参照している。<br>
- ;(ｾﾐｺﾛﾝ) : 最後にはセミコロンをつける。<br>
- -- (ﾊｲﾌﾝふたつ + ｽﾍﾟｰｽ) : コメントを作成するときに使用する。※スペースが必要！

### SQLコーディングの規約例
SQL クエリのコーディング規約（スタイルガイド）<br>
https://yulii.github.io/sql-style-guide-20160327.html

### SQL文の例
```
-- 全てのデータを取り出す
SELECT * FROM players;

-- 一部のカラムだけ取得する
SELECT name, level FROM players;

-- 複数の条件を組み合わせる
SELECT * FROM players WHERE level >= 7 AND job_id <> 6;
```


### WHEREの条件指定
|構文|意味|
|-|-|
|a = b|aとbが等しい(==ではないので注意)|
|a < b|aがbよりも小さい|
|a > b|aがbよりも大きい|
|a <= b|aがb以下である|
|a >= b|aがb以上である|
|a <> b|aとbが等しくない(!=ではないので注意)|


|条件をつなげるキーワード|意味|
|-|-|
|AND|両方の条件が成立した場合|
|OR|どちらか一方の条件が成立した場合|

## 1-4 いろいろな情報を取り出そう

### データの件数を表示する
```
-- データ件数を表示する
SELECT COUNT(*) FROM players;

-- 条件に合ったデータの件数を表示する
SELECT COUNT(*) FROM players WHERE job_id = 6;
```

### データを並び替えて取得
```
-- データを並び替えて取得する
SELECT * FROM players ORDER BY level;


-- データを並び替えて取得する 逆順
SELECT * FROM players ORDER BY level DESC;
```
DESCとはdescending(降順)の略

### 件数を絞って表示
```
-- 上位3件だけ表示する
SELECT * FROM players ORDER BY level DESC LIMIT 3;
```

### グループ化して表示
```
-- 職業ごとに人数を集計する
SELECT job_id, COUNT(*) FROM players GROUP BY job_id;
```

## 1-5 データを追加・更新・削除しよう

### データの追加
```
-- データを追加する
INSERT INTO players(id,name,level,job_id) VALUES(11, "霧島1号", 1, 1);

-- 一度に複数のデータを追加する
INSERT INTO players(id,name,level,job_id)
VALUES
(13, "霧島3号", 1, 1),
(14, "霧島4号", 1, 1)
;
SELECT * FROM players;
```

### データの更新
```
-- データを更新する
UPDATE players SET level = 10 WHERE id = 11;

-- データを更新する。1増加
UPDATE players SET level = level + 1 WHERE id = 12;
```

### データの削除
```
-- データを削除する
DELETE FROM players WHERE id >= 11;
```

## 1-6 2つのテーブルを結合しよう

### テーブルの関連付けについて
重複したデータのテーブルを分割しておいて、必要に応じて、仮想的な一つの表をして結合して扱う方法。<br>
テーブルを分ける理由は、重複したデータが膨大になると、管理に時間がかかる上にデータが重くなるからである。

### 結合の種類

- 内部結合(INNER JOIN): 両方のテーブルに共通のデータを表示
- 外部結合: 左結合+右結合+完全外部結合
- 左結合(LEFT JOIN): 左側テーブルを基準に表示
- 右結合(RIGHT JOIN): 右側テーブルを基準に表示
- 完全外部結合: 左側と右側のレコードを全て参照

### 結合のSQL文
```
-- テーブルを結合して表示する（内部結合）
SELECT * FROM players INNER JOIN jobs ON jobs.id = players.job_id;

-- テーブルを結合して表示する(左結合)
SELECT * FROM players LEFT JOIN jobs ON jobs.id = players.job_id;

-- テーブルを結合して表示する(右結合)
SELECT * FROM players RIGHT JOIN jobs ON jobs.id = players.job_id;
```
### 補足
MySQLは完全外部結合に対応していない。

## 1-7 結合したテーブルを操作しよう

### 結合したテーブルに対しての操作例
```
-- 結合したテーブルを操作する
SELECT * FROM players INNER JOIN jobs ON jobs.id = players.job_id;

-- 結合したテーブルで、指定カラムだけ表示
SELECT name, level, vitality FROM players INNER JOIN jobs ON jobs.id = players.job_id;

-- 結合したテーブルで、条件に合った行だけ表示
SELECT name, level, strength FROM players INNER JOIN jobs ON jobs.id = players.job_id WHERE strength >= 5;

-- 職業ごとに人数を集計する
SELECT job_id, job_name, COUNT(*) FROM players INNER JOIN jobs ON jobs.id = players.job_id GROUP BY job_id;
```

## 2-1 仕事にもSQLを使おう

ネットサービスの行動ログ解析を目的に学習していく。<br>
SQL文をクエリーと呼び、出てきた結果をビューと呼ぶ。

## 2-2 SQLの書き方のポイント

### カンマについて
カンマの多いとエラーになる。しかし、カンマ忘れの場合はエラーにならず通ってしまう。
```
例

SELECT userID name
FROM users
    INNER JOIN jobs ON jobs.jobID = users.jobID
    INNER JOIN area ON area.areaID = users.areaID;
```
SELECTの後ろでuserIDの後にカンマがないので、nameのみ取得してしまう。<br>
適切にカンマを使用することが大事。

### 重複するカラム名のデータ取得

重複するカラムのデータを取得したい場合は、カラム名の前にテーブル名を追加する。
```
例

SELECT area.name
FROM users
    INNER JOIN jobs ON jobs.jobID = users.jobID
    INNER JOIN area ON area.areaID = users.areaID;
```
もしもusersテーブルとareaテーブルで同じカラム名でnameを使用していた場合、<br>
nameの前にピリオドをつけ、areaテーブルを指定することで取得できる。

### WHERE文の記載
上手にインデントすることで、可読性が大きく変わる。
```
例

SELECT userID, name
FROM users
    INNER JOIN jobs ON jobs.jobID = users.jobID
    INNER JOIN area ON area.areaID = users.areaID;
WHERE
    userID >= 10
    AND userID < 20;
```
コードの分類ごとに、インデントを使い分ける。
- SELECT : どのレコードを取得したいのか
- FORM : どのテーブルを参照しているのか
- WHERE : どんな条件で取得しているのか

## 2-3 ログ解析してみよう

### 色んな関数
DATE関数 : 日付または日付時間式の日付部分を抽出します
```
-- 日次のアクセス数を求める
SELECT DATE(startTime), COUNT(logID)
FROM eventlog
GROUP BY DATE(startTime);
```

BETWEEN関数 : ある期間のデータを取得する
```
-- 日次のアクセス数を求める
SELECT DATE(startTime), COUNT(logID)
FROM eventlog
WHERE DATE(startTime) BETWEEN "2015-04-01" AND "2015-04-30"
GROUP BY DATE(startTime);
```

DATE_FORMAT関数 : 日付を指定された書式に設定します
```
-- 月次のアクセス数を求める
SELECT DATE_FORMAT(startTime, '%Y-%m'), COUNT(logID)
FROM eventlog
GROUP BY DATE_FORMAT(startTime, '%Y-%m');
```

<b>少しふかぼり</b>
大文字のYだと2024で取得できるが、小文字だと24になる。

### 日付および時間関数の参考URL
https://dev.mysql.com/doc/refman/8.0/ja/date-and-time-functions.html

## 2-4 アクティブユーザーを調べよう

### AS カラム名を別名で表示する
userIDだと視認性が悪いので、アクティブユーザーに変更している。
```
SELECT userID AS "アクティブユーザー"
FROM users;
```

### WHEREで空白の値のデータを表示 IS NULL
WHERE カラム IS NULLで空白の値を集計できる。
```
SELECT userID AS "アクティブユーザー"
FROM users
WHERE deleted_at IS NULL;
```

### 重複した行を省く DISTINCT
重複したuserIDを省いて表示する。
```
SELECT DISTINCT userID AS "アクティブユーザー"
FROM users;
```

## 2-5 データを集計しよう

### SELECT文の処理順
1. FROM 対象テーブルからデータを取り出す
2. WHERE 条件に一致するレコードを絞り込み
3. GROUP BY グループ化
4. HAVING 集計結果から絞り込み
5. SELECT 指定したカラムだけを表示

### SQLの集計関数
https://products.sint.co.jp/topsic/blog/sql-bootcamp-03#toc-1<br>

- SUM関数<br>
SUM関数は指定された項目Xの合計を返します。
ただし、項目Xの値がNULLの場合は除外して集計します。
```
SUM ( 項目X  )
```

- AVG関数<br>
AVG関数は指定された項目Xの平均値を返します。
ただし、項目Xの値がNULLの場合は除外して集計します。
```
AVG ( 項目X )
```

- MAX関数<br>
MAX関数は、指定された項目Xの最大値を返します。
```
MAX ( 項目X )
```

- MIN関数<br>
MIN関数は、指定された項目Xの最小値を返します。
```
MIN ( 項目X )
```

### HAVING句について
GROUP BYでグループ化した結果に条件式を適用できる。
```
SELECT 項目X , 項目Y , ・・・　FROM テーブル名
GROUP BY 項目X , 項目Y ・・・
HAVING 条件式;
```
SUM関数で合計したのちに比べたりするときに、使用する。

## 2-6 ユーザーの年齢を計算しよう

### 2つの時刻の計算

- TIMESTAMPADD(unit,interval,datetime_expr)<br>
整数式 interval を日付または日付時間式 datetime_expr に加算します。 interval の単位は、unit 引数で指定されます。この引数は、MICROSECOND (マイクロ秒)、SECOND、MINUTE、HOUR、DAY、WEEK、MONTH、QUARTER、YEAR 値のいずれかにする
```
mysql> SELECT TIMESTAMPADD(MINUTE,1,'2003-01-02');
        -> '2003-01-02 00:01:00'
mysql> SELECT TIMESTAMPADD(WEEK,1,'2003-01-02');
        -> '2003-01-09'
```

- TIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)<br>
datetime_expr2 − datetime_expr1 を返します。結果 (整数) の単位は、unit 引数で指定されます。 unit の有効な値は、TIMESTAMPADD() 関数の説明で一覧表示された値と同じです。
```
mysql> SELECT TIMESTAMPDIFF(MONTH,'2003-02-01','2003-05-01');
        -> 3
mysql> SELECT TIMESTAMPDIFF(YEAR,'2002-05-01','2001-01-01');
        -> -1
mysql> SELECT TIMESTAMPDIFF(MINUTE,'2003-02-01','2003-05-01 12:05:55');
        -> 128885
```

### 現在の時刻を取得
下記の3つが現在の時刻を求めるシノニム。
- CURRENT_DATE
- CURRENT_DATE()
- CURDATE()
```
SELECT CURRENT_DATE;

SELECT CURRENT_DATE();

SELECT CURDATE();
```
シノニムって？<br>
SQLにおけるシノニム（synonym）とは、ある関数やコマンドが異なる名前でも同じ機能を持つ場合を指します。つまり、複数の名前が同じ動作をするということです。

## 2-7 テキストを検索しよう

### LIKE命令 検索する
下記のコードでは「●●との闘い」を検索することができる。
```
-- テキスト検索
SELECT
	events.event_summary
FROM
	eventlog
	INNER JOIN events ON events.eventID = eventlog.eventID
WHERE  events.event_summary LIKE '%との闘い'
```

<b>すこしふかぼり</b><br>
LIKE句で使用可能なワイルドカード

| ワイルドカード | 意味 |
| - | - |
| % | 0文字以上の任意の文字列 |
| _ | 任意の1文字 |

## 2-8 サブクエリでアクティブユーザー数を求めよう
```
-- FROM句に書く場合
SELECT *
FROM (サブクエリ) AS (サブクエリ名);
```
```
SELECT 列名1, 列名2, ...
FROM テーブル名
WHERE 列名 = ( 
    SELECT 列名
    FROM テーブル名
    [WHERE 条件式など]
)
```
サブクエリの例
```
SELECT
    yearMonth,
    COUNT(user)
FROM 
    (SELECT DISTINCT
    	DATE_FORMAT(startTime, '%Y-%m') AS yearMonth,
    	eventlog.userID AS user
    FROM eventlog
    	INNER JOIN users ON users.userID = eventlog.userID
    WHERE deleted_at IS NULL)
AS years
GROUP BY yearMonth;
```

## 2-9 グループ分けしよう
### CASE命令
case命令を使用するとデータを分類できる。
```
-- データを分類し直す
SELECT
	userID,
	level,
	CASE
		WHEN (条件式1) THEN (出力1)
		WHEN (条件式2) THEN (出力2)
		ELSE (出力3)
	END
FROM
	users;
```

## 2-10 クロス集計してみよう

### クロス集計を作る手順
1. クロス集計の元になるデータを用意する
2. サブクエリとして読み込む
3. CASEで、特定の値だったら1にする。このとき別名を、特定の値と同じにする
```
CASE WHEN クラス = "初級" THEN 1 ELSE NULL END AS "初級",
CASE WHEN クラス = "中級" THEN 1 ELSE NULL END AS "中級",
CASE WHEN クラス = "上級" THEN 1 ELSE NULL END AS "上級"
```
4. SUM関数とGROUP BYで集計する

### 実装例
```
-- 所持金で分類してクロス集計
SELECT
	日付,
	SUM(CASE WHEN finance = "大金持ち" THEN 1 ELSE 0 END) AS "大金持ち",
	SUM(CASE WHEN finance = "小金持ち" THEN 1 ELSE 0 END) AS "小金持ち",
	SUM(CASE WHEN finance = "発展途上" THEN 1 ELSE 0 END) AS "発展途上"
FROM ( SELECT DISTINCT
	DATE_FORMAT(startTime, '%Y%m') AS 日付,
	eventlog.userID,
	(CASE
		WHEN gold >= 3000 THEN "大金持ち"
		WHEN gold >= 1000 THEN "小金持ち"
		ELSE "発展途上"
	END) AS finance
	FROM eventlog
		INNER JOIN users ON users.userID = eventlog.userID
	) AS クラス分け
GROUP BY 日付;
```

## 2-11 サブクエリで、平均や割合を求めよう

### 色んなサブクエリ
FROM句に書く場合
```
-- FROM句に書く場合
SELECT *
FROM (サブクエリ) AS (サブクエリ名);
```

WHERE句に書く場合
```
-- WHERE句に書く場合
SELECT *
FROM users
WHERE level = ((サブクエリ));
```

SELECT句に書く場合
```
-- SELECT句に書く場合
SELECT (サブクエリ) AS (サブクエリ名)
FROM users;
```

### 実装例
```
-- 平均以上の所持金を持つユーザー数を表示する
SELECT userID, name, gold
FROM users
WHERE gold >= (SELECT AVG(gold) FROM users);
```