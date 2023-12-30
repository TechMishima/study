# TIL
## Javaとは
オブジェクト指向の言語<br>
初心者には敷居が高い？<br>
ライブラリや教材がしっかりしている
## リファレンスリンク
https://docs.oracle.com/javase/jp/8/docs/api/<br>
https://ja.wikipedia.org/wiki/Java%E3%81%AE%E6%96%87%E6%B3%95<br>
https://nattou-curry-2.hatenadiary.org/entry/20100130/1264821094<br>

## printlnメソッド
```
public class Main {
	public static void main(String[] args) {
		System.out.println("hello world");
	}
}
```
## コメントアウト
```
// 1行のみコメントアウト

/*
複数行のコメントアウト
*/
```

## HTMLの表示
```
// HTMLを表示する
public class Main {
    public static void main(String[] args) {
        System.out.print("<h1>hello world</h1>");
        System.out.print("<p>世界の皆さん、");
        System.out.print("<b>こんにちは</b></p>");
    }
}
```
## 予約語について
https://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%BC%E3%83%AF%E3%83%BC%E3%83%89_%28Java%29

## 変数の宣言について
変数を使うとき、最初にデータの種類を指定して宣言する必要があります。<br>
2回目以降、変数にデータを代入する時には、データの種類の指定は不要です。
```
String player = "勇者"; // 文字列データの変数
int number = 3; // 整数データの変数
double rand = Math.random(); // 小数点以下データの変数
```

## 指定したデータの出力メソッド
```
System.out.println(data) ：指定したデータを出力する（改行あり）
System.out.print(data) ：指定したデータを出力する（改行なし）
```
## 型変換について
double型のデータをint型のデータにするなど、変更するときに使用する。
```
int number = (int)60.5;
```
上記だと60の整数データを定義できる。
## Math.randomメソッド
```
ath.random()というメソッドを呼び出すと、0から1の間のランダムな数値が戻り値となります。
```