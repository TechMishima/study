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