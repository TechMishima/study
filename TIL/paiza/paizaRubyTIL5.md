# ToDo
累積和の復習<br>
https://paiza.jp/works/mondai/query_primer/query_primer__cumulative_sum

# TIL
## なぜタイムオーバーになるのか調べる
### 修正前のコード
```
N, K = gets.split.map(&:to_i)
numbers = []
N.times do
    numbers << gets.to_i
end

num = 0
K.times do
    num = gets.to_i
    answer = 0
    num.times { |i| answer += numbers[i] }
    puts answer
end
```
## PAIZAの解説
### 解説
各 Q_i (1 ≦ i ≦ K) について A_1 ... A_{Q_i} の和をいちいち計算すると、最悪ケースのとき、プログラム全体でループが K × N 回回るため実行時間に間に合いません。<br>
では実行時間に間に合わせるためにはどうしたら良いでしょうか。<br>
A_1 から A_i までの和を sum[i] とすると、sum[i] = sum[i-1] + A[i] という関係が成り立つことを用いて、すべての i について sum[i] を計算しておくことで、この問題を実行時間内に解くことができます。<br>
今回の問題で求めた区間の和 を 累積和 といい、計算量を落とす際にしばしば用いられます。

### 上記をみて
ループが発生して実行時間がかかりすぎるのが原因。
Kが36324、Nが19472だととんでもないｽﾃｯﾌﾟが必要になる。

## 以上をふまえて
### 修正後のコード
```
N, K = gets.split.map(&:to_i)
numbers = []
num = 0
N.times do
    num += gets.to_i
    numbers << num
end

K.times do
    num = gets.to_i
    puts numbers[num - 1]
end
```
### まとめ
答えが重複するようなアルゴリズムを組む時は、結果をまとめて保存する。
それにより、再度計算する必要がなくなり、ｽﾃｯﾌﾟ数が減る。