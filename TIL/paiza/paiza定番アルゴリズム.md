# ToDo
https://paiza.jp/works/mondai<br>
上記の「定番アルゴリズムの習得」を学ぶ

# Progress
- 線形探索メニュー
  - 【指定された値の探索】指定された値の位置 3
  - 【最大最小】n 変数の最大最小 Ruby編
  - 条件付き最大値
  - 長方形に含まれる点
  - 【特殊な探索】 成績優秀者の列挙 2
  - 【第 k 要素の探索】k番目に大きな値
  - 終了
- 素朴なソートアルゴリズムメニュー
  - 挿入ソート
  - 選択ソート
  - バブルソート
- 効率的なソートアルゴリズムメニュー

# TIL

## 線形探索

### 線形探索とは？

https://wa3.i-3-i.info/word111109.html<br>
端から順番にデータを探していく探索方法の事。<br>
「逐次探索」、「リニアサーチ」とも呼ばれる。

## ソートアルゴリズム

### ソートとは？
順序付け可能なデータの列を、昇順または降順に並び替える操作をソートと呼びます。<br>
「データ」は、数値や文字列、オブジェクトなどあらゆるものを指します。

### 挿入ソートとは？
挿入ソートは、データ列を「整列済み」と「未整列」の2つに分け、「未整列な配列」からデータを1つ取り出し、「整列済み配列」の適切な位置に挿入することを繰り返す手法です。


整列された部分（確定とは限らない）を打消し線、挿入する部分を太字で表す。<br>
8	4	3	7	6	5	2	1	（初期データ）<br>
~~4	8~~	**3**	7	6	5	2	1	（1回目のループ終了時）<br>
~~3	4	8~~	**7**	6	5	2	1	（2回目のループ終了時）<br>
~~3	4	7	8~~	**6**	5	2	1	（3回目のループ終了時）<br>
~~3	4	6	7	8~~	**5**	2	1	（4回目のループ終了時）<br>
~~3	4	5	6	7	8~~	**2**	1	（5回目のループ終了時）<br>
~~2	3	4	5	6	7	8~~	**1**	（6回目のループ終了時）<br>
~~1	2	3	4	5	6	7	8~~	（7回目のループ終了時。ソート完了）<br>

挿入ソートの計算量について<br>
一番多く計算される場合を想定して計算する。<br>
等差数列の和の公式をつかう。
$$S = \frac{n}{2} (a + l)$$
- n : 項数 = n - 1
- a : 初項 = 1
- l : 末項 = n - 1
$$= \frac{n-1}{2} (1 + n - 1)$$
$$= \frac{n-1}{2} (n)$$
$$= \frac{n^2 - n}{2}$$
上記をビッグオー記法にしてみる。<br>
ビッグオー記法は、アルゴリズムの計算量を表すために使用される数学的な表現です。<br>
特に、入力に対するアルゴリズムの最悪時の実行時間や空間使用量の増加率を示します。<br>
数が大きくなっていくとn^2が大きく計算結果にかかわってくるので、下記になる。
$$= O(n^2)$$

挿入ソートが優れている点
- ソートがある程度できている場合。逐次追加してソートしなおす場合など。
- アルゴリズムが非常に簡易である。

作成（とてもきたない）
```
n = gets.to_i
nums = gets.split.map(&:to_i)

# a = nums.delete_at 1

(n - 1).times do |s|
    target = nums.delete_at s + 1
    t = 0
    switch = false
    while t <= s
        if target <= nums[t]
            nums.insert(t, target)
            switch = true
        end
        break if switch == true
        t += 1
        if t == s + 1
            nums.insert(t, target)
            switch = true
        end
        break if switch == true
    end
    puts nums.join(" ")
end
```
修正してくれた
```
n = gets.to_i
nums = gets.split.map(&:to_i)

(n - 1).times do |i|
  target = nums.delete_at(i + 1)  # 挿入対象を取得して削除
  j = i
  while j >= 0 && nums[j] > target
    j -= 1
  end
  nums.insert(j + 1, target)  # 適切な位置に挿入
  puts nums.join(" ")
end
```
提案された
```
# 入力を受け取る
n = gets.to_i
nums = gets.split.map(&:to_i)

# 挿入ソートの実装
(1...n).each do |i|
  key = nums[i]
  j = i - 1
  # nums[j] > key の間はnums[j]を右にシフト
  while j >= 0 && nums[j] > key
    nums[j + 1] = nums[j]
    j -= 1
  end
  nums[j + 1] = key
  puts nums.join(" ")  # 各ステップでの配列の状態を出力
end
```
paizaのコードを生成AIで変換
```
n = gets.to_i
a = gets.split.map(&:to_i)

for i in 1...n
    x = a[i]
    j = i - 1

    while j >= 0 && a[j] > x
        a[j + 1] = a[j]
        j -= 1
    end

    a[j + 1] = x

    puts a.join(" ")
end
```
最適解だと、ターゲットを左の数字と確認し、小さい場合は左へずらしていくプロンプトで行っていく。

### 選択ソートとは？
選択ソート (昇順) は、データ列を「整列済み」と「未整列」の2つに分け、「未整列な配列」の最小値を取り出し、「整列済み配列」の末尾に付け加えることを繰り返す手法。

選択ソートの計算量について<br>
一番多い計算量を考えると最初はn-1数えて1ずつ減っていく。<br>
よって、挿入ソートと同様の計算量になる。
$$O(n^2)$$
しかし、一番計算量が少ないパターンを考えた時、
最良計算量は挿入ソートが O(n)に対して、選択ソートはO(n2)になる。<br>


どんな時に使うのか？<br>
データを並び替える目的ではなく、上位10件を取り出したい時などに使用する。<br>
（挿入ソートの場合は上位10件を知るために、すべてを並び替えないといけないため。

自作コード(挿入よりうまくできた？)
```
n = gets.to_i
nums = gets.split.map(&:to_i)

min_index = 0
(n - 1).times do |s|
    min = 10001

    for t in s..n-1 do
        if nums[t] < min
        min = nums[t]
        min_index = t
        end
    end
    
    target1 = nums[s]
    target2 = nums[min_index]
    nums[s] = target2
    nums[min_index] = target1
    puts nums.join(" ")
end
```
paizaコードをrubyに変換
```
n = gets.to_i
a = gets.split.map(&:to_i)

(0...n-1).each do |i|
min_index = i
(i+1...n).each do |j|
  min_index = j if a[j] < a[min_index]
end

a[i], a[min_index] = a[min_index], a[i]

puts a.join(' ')
end
```
変換したコードを見ると、データの交換を一行にできるから自作コードはもっとすっきりできそう！

### バブルソートとは？

バブルソートは、データ列の隣り合う要素を比較し交換することを繰り返すことによりデータ列をソートする手法。<br>
バブルとは「泡」の意味で、ソートの過程でデータが移動する様子が、水中で泡が浮かんでいくように見えることからこの名前がついている。

どんな時につかうの？<br>
実装が容易である。アルゴリズムの学習に適している。

自作コード
```
n = gets.to_i
nums = gets.split.map(&:to_i)

(n-1).times do |i|
    (n-1-i).times do |j|
        if nums[-1+(-1*j)] < nums[-2+(-1*j)]
            nums[-1+(-1*j)], nums[-2+(-1*j)] = nums[-2+(-1*j)], nums[-1+(-1*j)]
        end
    end
    puts nums.join(" ")
end
```
paizaコードを生成aiで変換
```
n = gets.to_i
a = gets.split.map(&:to_i)

(0...n-1).each do |i|
(n-1).downto(i+1) do |j|
  if a[j-1] > a[j]
    a[j-1], a[j] = a[j], a[j-1]
  end
end

puts a.join(' ')
end
```