# ToDO
情報処理入門 テクノロジー編<br>
https://paiza.jp/works/technology/primer

# TIL

## 1-1 コンピュータのデータ表現について学んでいこう

学習内容の確認

- 表現単位
- 基数
- 数値の表現
- 誤差
- シフト演算

## 1-2 基本的なデータの単位と接頭辞

### 表現単位

| 0                  | 1                  |
|---------------------|---------------------|
| 電気が流れていない | 電気が流れている   |
| 電圧が低い          | 電圧が高い          |

最小単位の0，1の事をビットという。<br>
8ビット=1バイト

### 表現の種類

1ビットだと1、0の2種類<br>
2ビットだと00，01，10，11の4種類<br>
すなわち、nビットだと2のn乗種類の表現ができる。
$$ nビット ・・ 2^n種類 $$

### 接頭辞

言葉のはじめにつけて意味を加える言葉、ITでは数値を見やすくするための手法。<br>
1000g = 1kg<br>
上記のkのキロが接頭辞にあたる。<br>

### 大きな値を表すときに使われる接頭辞

| 記号 | 読み方 | 10進数 | 2進数    |
|------|--------|--------|----------|
| K    | キロ   | 10³    | 2¹⁰      |
| M    | メガ   | 10⁶    | 2²⁰      |
| G    | ギガ   | 10⁹    | 2³⁰      |
| T    | テラ   | 10¹²   | 2⁴⁰      |
| P    | ペタ   | 10¹⁵   | 2⁵⁰      |

### 小さな値を表すときに使われる接頭辞

| 記号 | 読み方     | 10進数   | 2進数    |
|------|------------|----------|----------|
| m    | ミリ       | 10⁻³     | 2⁻¹⁰     |
| μ    | マイクロ   | 10⁻⁶     | 2⁻²⁰     |
| n    | ナノ       | 10⁻⁹     | 2⁻³⁰     |
| p    | ピコ       | 10⁻¹²    | 2⁻⁴⁰     |

### 正確に区別する場合

| 記号 | 読み方     | 2進数    |
|------|------------|----------|
| Ki   | キビ       | 2¹⁰      |
| Mi   | メビ       | 2²⁰      |
| Gi   | ギビ       | 2³⁰      |
| Ti   | テビ       | 2⁴⁰      |
| Pi   | ペビ       | 2⁵⁰      |

## 1-3 基数

基数とは数値を表現するときに、位取りのもととなる値のこと。<br>

$$ 267.8 = 2*10^2 + 6* 10^1 + 7*10^0 +8*10^-1 $$

上記の10を基数と呼び、上の数字をべき乗と呼ぶ。<br>
10進数を表記するときは（110.1）₁₀のように右下に表記する。<br>
８進数や16進数もある。<br>
なぜ8と16なのかは、2進数から変換するときに行いやすいから。

## 1-4 基数変換

基数を扱いやすいように変換する。

2進数から8進数、16進数は変換しやすい。<br>
しかし2進数から10進数へは規則性がないため、計算しなくてはいけない。

### 2進数から10進数への基数変換

例 1011(2進数)の変換

1, 右から左へ、各桁に 2 の累乗（べき乗）をかける

1 × 2^3 = 8  
0 × 2^2 = 0  
1 × 2^1 = 2  
1 × 2^0 = 1

2, すべて足し算する

8 + 0 + 2 + 1 = 11（10進数）

### 10進数から2進数への基数変換

例 10.625（10進数）を2進数に変換

1, 整数部分の変換

10 ÷ 2 = 5 余り 0  
5 ÷ 2 = 2 余り 1  
2 ÷ 2 = 1 余り 0  
1 ÷ 2 = 0 余り 1  

→ 下から読む → 1010

2, 小数部分の変換

0.625 × 2 = 1.25     → 整数部分「1」、残り「0.25」
0.25 × 2  = 0.5      → 整数部分「0」、残り「0.5」
0.5 × 2   = 1.0      → 整数部分「1」、残り「0.0」→終了

→ 上から読む → 101

3, 合計して1010.101になる。

## 1-5 数値表現 - その1

- 2進数
  - コンピュータ内部で計算を行うときに適している。

- 10進数
  - 人間にとって馴染みがあり、わかりやすい

### 2進化10進コード（BCDコード）

10進数で表された、数字を各桁で区切って2進数に変換したコード

例 10進数 1649

1 ・・・ 0001<br>
6 ・・・ 0110<br>
4 ・・・ 0100<br>
9 ・・・ 1001

2進化10進コード 0001 0110 0100 1001

### ゾーン10進数

ゾーンビット,2進化10進コード,符号ビット,2進化10進コードの順番になる。

EBCDICだと、<br>
ゾーンビット : 1111<br>
符号ビット : (+)1100 (-)1101<br>
になる。

例） 10進数 -1763

1763を2進化10進コードにする。<br>
0001 0111 0110 0011

ゾーンビットを配置していき、最後だけ符号ビットを配置する。<br>
1111 (0001) 1111 (0111) 1111 (0110) 1101 (0011)<br>
1111 0001 1111 0111 1111 0110 1101 0011

### パック10進数

(0000),2進化10進コード,符号ビットの順番になる。<br>
0000は偶数桁の場合、つける。

例 ）
+528

5.2.8.+の順番に配置する。<br>
0101 0010 1000 1100

-1763

偶数桁なので0000を先頭につける。<br>
0000.1.7.6.3.-の順番に配置する。<br>
0000 0001 0111 0110 0011 1101

### ゾーン10進数とパック10進数の関係

- ゾーン10進数<br>
入力装置から10進数で入力する場合や出力装置で10進数を出力する場合はゾーン10進数を使ったほうが簡単

- パック10進数<br>
より少ないバイト数で多くの情報を表現することができる

ゾーン10進数からパック10進数へ変換することを「パック」といい、<br>
逆にパック10進数からゾーン10進数へ変換することを「アンパック」という。

## 1-6 数値表現 - その2

### コンピュータ上で小数を表現する方法

- 固定小数点数
  - 整数部と小数部の桁数をあたかじめ決めておく
- 浮動小数点数
  - 表現する値に合わせて小数点の位置を変える

### 固定小数点数

最上位ビット<br>
正 : 0  負 : 1

固定小数点数で負の数を表すときは、補数を用いる。

### 補数とは？

ある数に足したとき、桁が1つ上がる最も小さい数

例）<br>
98 + 1 = 99 ・・・桁は上がっていない<br>
98 + 2 = 100 ・・・桁は上がっている<br>
98 + 3 = 101 ・・・桁は上がっている<br>
上記より、桁が上がる最も小さい数は「2」となる。

### 負の数を2進数で表す方法

補数を用いる。<br>
ある数(負の数)に正の数を足したとき、桁が1つあがり、0になる数を計算する。<br>

例）-25を2進数にする

1. 正の数25を2進数にする。<br>
(25)₁₀ ⇒ (00011001)₂<br>
2. 0に正の数25を引く。<br>
(100000000)₂ - (00011001)₂ = (11100111)₂

簡単な方法）
1. 正の数25を2進数にする。<br>
(25)₁₀ ⇒ (00011001)₂<br>
2. 0と1をひっくり返す。<br>
00011001 ⇒ 11100110
3. 一番下を1プラスする。<br>
11100110 ⇒ 11100111

### 補数表現が用いられている理由

減算を加算に置き換えて演算できるから

例） 15-10<br>
2進数へ変換する。<br>
15 = (00001111)₂<br>
10 = (00001010)₂

0から10を引く。<br>
-10 = (11110110)₂

15と-10を足してみて、5にあたるか確認する。<br>
(00001111)₂ + (11110110)₂ = (00000101)₂ = 5

## 1-7 数値表現 - その3

固定小数点数だと、大きな数値やとても小さい小数点以下の数値を扱うとき、大量のビットが必要になってしまう。<br>
浮動小数点数にすることで扱いが容易になる。

例）120000000<br>
= 0.12 * 10⁹<br>
= (-1)⁰ * 0.12 * 10⁹

上記より
- 符号 ・・・ 0
  - 数値が正か負を表現する
- 仮数 ・・・ 12
  - 小数点以下に変換された数値
- 指数 ・・・ 9
  - 仮数に10の何乗をかけるか

(-1)符号 * 仮数 * (基数)指数

### IEEE754形式 (ｱｲﾄﾘﾌﾟﾙｲｰ754)

- 単精度浮動小数点数(32ビット形式)
  - 符号部 1ビット
  - 指数部 8ビット
  - 仮数部 23ビット
- 倍精度浮動小数点数(64ビット形式)
  - 符号部 1ビット
  - 指数部 11ビット
  - 仮数部 52ビット

### 各部の説明
- 符号部 : 数値の符号を表す(正=0, 負=1)
- 指数部 : 基数に対する指数を表す
  - 2の補数 : 指数を2進数で記録
  - エクセス方式 : 指数に一定の値を加算した値を記録
-  仮数部 : 小数点以下の数値を表す

### 正規化

仮数部に使用できる数字を増やし、数値の制度を保つ

例） 0.000123456789

そのままの状態で仮数部に記録すると・・・<br>
0 0 0 1 2 3 4

0.123456789 * 10^-3に変換してから記録すると<br>
1 2 3 4 5 6 7