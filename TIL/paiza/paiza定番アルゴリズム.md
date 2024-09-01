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
  - マージソート（計算量）
- 素数メニュー
- ユークリッドの互除法メニュー

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

### シェルソートとは？
> シェルソートは、挿入ソートを改良したアルゴリズムです。<br>挿入ソートが整列済みのデータ列に強いことを利用しています。<br>
<br>
シェルソートでは、データ列において一定の間隔 h だけ離れた要素たちからなる部分列を対象とした挿入ソートを、h を小さくしながら (間隔を狭めながら) 繰り返してソートを行っていきます。<br>h は適当に大きな値から始め、段階的に小さくしていき、最終的に 1 にします。<br>h が 1 のとき、間隔が 1 離れた要素たちからなる部分列というのは元のデータ列そのものですから、このとき単純な挿入ソートを行うことになります。<br>この時点でデータ列は既にほとんど整列済みとなっていることが期待されるため、ここで挿入ソートの強みが活かされます。

計算量は？<br>
シェルソートの計算量は間隔列 h に強く依存する。<br>
シェルソートの計算量解析を正確に行うことは難しく、未解決。

間隔の決め方について<br>
1. オリジナルギャップ ※10のデータだと 5.2.1になる。
$$ [\frac{n}{2^k}] $$
2. 平均計算時間$O(n^1.25)$ ※1.4.13.40.121.....
$$ \frac{3^k-1}{2} $$



自作コード
```
n = gets.to_i
a = gets.split.map(&:to_i)
k = gets.to_i
dis = gets.split.map(&:to_i)

dis.each do |h|
    ans = 0
    for i in h...n
    x = a[i]
    j = i - h

        while j >= 0 && a[j] > x
            a[j+h] = a[j]
            j -= h
            ans += 1
        end
    a[j+h] = x
    end
    puts ans
end
```
paizaコードをrubyに変換
```
def insertion_sort(a, n, h)
  num_of_move = 0

  (h...n).each do |i|
    x = a[i]
    j = i - h

    while j >= 0 && a[j] > x
      a[j + h] = a[j]
      j -= h
      num_of_move += 1
    end

    a[j + h] = x
  end

  puts num_of_move
end

def shell_sort(a, n, h)
  h.each do |h_i|
    insertion_sort(a, n, h_i)
  end
end

n = gets.to_i
a = gets.split.map(&:to_i)
k = gets.to_i
h = gets.split.map(&:to_i)

shell_sort(a, n, h)
```

### マージソートとは？
>マージソートは、データ列を二分し、それぞれをマージソートした後それらを「マージ (統合) 」することを繰り返すソートアルゴリズムです。<br>
マージソートは、問題を小さな問題に分割して解くことを繰り返すことによって元の問題の答えを得る手法である「分割統治法」に基づいたアルゴリズムです。<br>
データ列を二分してマージソートを行う merge_sort と、昇順にソートされた2つの部分データ列をマージする merge から成ります。

計算量は？<br>
例としてn = 8個データを計算するとしたときについて考えると、分割するときは、<br>
8 → 4.4 → 2.2.2.2 → 1.1.1.1.1.1.1.1 の3ｽﾃｯﾌﾟに分かれる。<br>
計算しきとしては、下記のようになっている。
$$log_28 = 3$$
上記をビッグオー記法にすると、2の底は比例に関係は少ないので、下記になる。
$$ logn $$
ステップがlogn、行う回数はnに比例するので、計算量は下記になる。
$$ O(n) = nlogn $$

コード作成<br>
paizaコードを修正 ※でもタイムエラーになる
```
$count = 0
INF = 1000000001

def merge(arr, left, mid, right)
  l = arr[left...mid] + [INF]
  r = arr[mid...right] + [INF]

  lindex = 0
  rindex = 0

  (left...right).each do |i|
    if l[lindex] < r[rindex]
      arr[i] = l[lindex]
      lindex += 1
    else
      arr[i] = r[rindex]
      rindex += 1
      $count += 1
    end
  end
end

def merge_sort(arr, left, right)
  if left + 1 < right
    mid = (left + right) / 2
    merge_sort(arr, left, mid)
    merge_sort(arr, mid, right)
    merge(arr, left, mid, right)
  end
end

n = gets.to_i
arr = gets.split.map(&:to_i)

merge_sort(arr, 0, n)

puts arr.join(' ')
puts $count
```

https://paiza.jp/works/algorithm-java/new-primer/algorithm-java-new-primer-5<br>
学習する

https://qiita.com/fujimotoprogramming/items/6a3aed1da1f7d07b011b<br>
ランタイムエラーにならない回答をしている方

### クイックソート

>クイックソートは、ピボットと呼ばれる値を1つ選び、それを基準としてデータ列を「ピボット未満の要素からなるデータ列」と「ピボット以上の要素からなるデータ列」に二分することを再帰的に行うアルゴリズムです。<br>
このアルゴリズムは、問題を小さな問題に分割して解くことを繰り返すことによって元の問題の答えを得る手法である「分割統治法」に基づいており、実用的なソートアルゴリズムの中で最も高速であるとされています (名前に quick と付いていることからも、その高速さが評価されていることが窺えます)。

計算量は？
>「ピボットの選び方とデータ列の相性」に強く依存しています。<br>
クイックソートの平均計算量はO(n log n)であり、最悪計算量は O(n^2)であることが知られています。

>ピボットの選び方<br>
・データ列の先頭をとる<br>
・データ列の末尾をとる<br>
・データ列からランダムにとる<br>
・データ列からランダムに2つとり、その中央値をとる

コードはマージソートと似ている
```
$count = 0

def quick_sort(a, left, right)
    if left + 1 >= right
        return
    end

    pivot = a[right - 1]
    cur_index = left

    for i in left..right - 2
        if a[i] < pivot
            a[cur_index], a[i] = a[i], a[cur_index]
            cur_index += 1
            $count += 1
        end
    end

    a[cur_index], a[right - 1] = a[right - 1], a[cur_index]
    quick_sort(a, left, cur_index)
    quick_sort(a, cur_index + 1, right)
end

n = gets.to_i
a = gets.split.map(&:to_i)
quick_sort(a, 0, n)
puts a.join(' ')
puts $count
```

## 素数メニュー

### 計算量の少ない素数判定について
定義通りで素数判定。
- 1でなはい。
- 1,自身以外の自然数できれいに割り算ができない
```
count = 0
for i in 1..57
    if 57 % i == 0
        count += 1
    end
end

if count == 2 && 57 >= 2
    puts "YES"
else
    puts "NO"
end
```
>実は N を割り切れるかどうかを 2 〜 N-1 の全ての整数について調べなくても、 2 〜 ルート N の整数について調べるだけで N の素数判定ができます。
具体的な証明は省略しますが、これは N に 1 と N 以外の約数があると仮定した場合、少なくとも 1 つは N の 0.5 乗（ルート N ） 以下の約数があるという約数の性質に基づくものです。

上記について、30と25について考えてみる。<br>
$$\sqrt{30} = 約5.477$$
$$\sqrt{25} = 5$$
よって、30と25はともに、2から5までの自然数で割り切れるかどうか確認する。<br>
30 = 2 * 3 * 5であり、2の段階で素数でないと判別できる。<br>
25 = 5 * 5であり、5の段階で素数でないと判別できる。<br>
次の数字の6を考慮したとき、5 * 6 = 30であり、25より大きな数字になってしまう。<br>
よって、$ \sqrt{n} $までの自然数で割り切れない事だけ確認すればよいことになる。
```
n = gets.to_i

count = 0
for i in 1..(n**0.5)+1
    if n % i == 0
        count += 1
    end
end

if count == 1 && n >= 2
    puts "YES"
else
    puts "NO"
end
```
### エラトステネスのふるい
値がtrueの配列を準備、0.1は素数なのでfalse、iがtrueならi*2,i*3....i*nをfalseにする。<br>
例として2がtrueなので、4,6,8,10....をfalseにする。<br>
完成した配列で素数判定を行う。
```
n = gets.to_i
is_prime = Array.new(n + 1, true)
is_prime[0], is_prime[1] = false, false

for i in (2..n)
    if is_prime[i] == true
        num = 2
        while i * num <= n
            is_prime[i*num] = false
            num += 1
        end
    end
end

if is_prime[n] == true
    puts "YES"
else
    puts "NO"
end
```

### フェルマーの小定理
https://club.informatix.co.jp/?p=4737<br>

>①「pが素数ならば、任意の整数nのp乗をpで割った余りはnである」というもの

>>素数p=3の場合<br>
$n=2　2^3=8　→　3で割ると商が2、余りは2$<br>
$n=3　3^3=27　→　3で割ると商が8、余りは3$<br>
$n=4　4^3=64　→　3で割ると商が20、余りは4$<br>
$n=5　5^3=125　→　3で割ると商が40、余りは5$<br>

>>素数p=5の場合<br>
$n=2　2^5=32　→　5で割ると商が6、余りは2$<br>
$n=3　3^5=243　→　5で割ると商が48、余りは3$<br>
$n=4　4^5=1024　→　5で割ると商が204、余りは4$<br>
$n=5　5^5=3125　→　5で割ると商が624、余りは5$<br>

>>素数でないp=6の場合<br>
$n=2　2^6=64　→　6で割ると商が10、余りは4$<br>
$n=3　3^6=729　→　6で割ると商が121、余りは3$<br>
$n=4　4^6=4096　→　6で割ると商が682、余りは4$<br>
$n=5　5^6=15625　→　6で割ると商が2604、余りは1$

言い換えると
>②pとnは互いに素（公約数が1だけ）のとき、pが素数ならば、任意の整数nのp-1乗をpで割った余りは1である

pとnが互いに素とは？<br>
例：p=8 n=15<br>
8の約数 : 1.2.4.8<br>
15の約数 : 1.3.5.15

>>素数p=3の場合<br>
$n=2　2^2=4　→　3で割ると商が1、余りは1$<br>
$n=3　pとnは互いに素でない。公約数が1以外の3がある。$<br>
$n=4　4^2=16　→　3で割ると商が5、余りは1$<br>
$n=5　5^2=25　→　3で割ると商が8、余りは1$<br>

しかしフェルマーの小定理は素数の判定にはなりえない。<br>
なぜか？定理に当てはまるが素数でないカーマイケル数が存在するから。<br>
561, 1105, 1729, 2465, 2821, 6601, 8911,・・・・・と無数に存在する。

②の定義でコードを作成する。
```
is_prime = true
n = gets.to_i

# N が a で割り切れる場合は N は素数でないと判定する。
if n % 2 == 0
    is_prime = false
end

# a^(N-1) を N で割ったあまりが 1 ならば N は素数、1 でない場合は素数でないと判定する。
if (2**(n-1)) % n != 1
    is_prime = false
end

if is_prime == true
    puts "YES"
else
    puts "NO"
end
```

### 素因数分解
```
n = gets.to_i
num = 2
while n > 1
    if n % num == 0
        puts num
        n = n / num
    else
        num += 1
    end
end
```

### 約数の個数

>ある整数 N の約数の個数は、N を素因数分解したときに現れる全ての{素数の累乗 + 1} の積であることが知られています。<br>
よって、整数 N をN = (p^n)(q^m)(r^l)... と素因数分解できるとき、約数の個数は(n+1)(m+1)(l+1)...となります。<br>
例として、12 の約数の個数は 12 = 2^2 × 3^1 より、(2+1)×(1+1) = 6 個と求まります。

自作
```
n = gets.to_i
num = 2
ans = []
while n > 1
    if n % num == 0
        ans << num
        n = n / num
    else
        num += 1
    end
end

i = 1
n_ans = []
ans.each do |num|
    if num != i
        i = num
        n_ans << 1
    else
        n_ans[-1] += 1 
    end
end

target = 1
n_ans.each do |ans|
    target *= ans + 1
end
puts target
```

paizaコードを生成AIで変換
```
divisors = Hash.new(0)

N = gets.to_i

(2..Math.sqrt(N).to_i).each do |i|
  while N % i == 0
    divisors[i] += 1
    N /= i
  end
end

divisors[N] += 1 if N != 1

ans = 1
divisors.each do |k, v|
  ans *= v + 1
end

puts ans
```
2で割れたらキーが2の値を1増やす。<br>
連想配列(ハッシュ)を使用すると管理が楽になる。

### 最大公約数

生成AIで確認

素因数分解を行い、連想配列にする。<br>
2番目からの数値も素因数分解を行い、前の連想配列と比較し、小さいほうを採用する。<br>
Hash.new(0)なので、デフォルト値の0と比較してくれる。nilと比較しないようにハッシュを作成するのが肝！<br>
```
def factorize(a)
  prime_factor_map = Hash.new(0)

  j = 2
  while j ** 2 <= a
    while a % j == 0
      prime_factor_map[j] += 1
      a /= j
    end
    j += 1
  end

  prime_factor_map[a] += 1 if a != 1

  prime_factor_map
end

N = gets.to_i
A = gets.to_i

prime_factor_map = factorize(A)

(1...N).each do
  A = gets.to_i
  prime_factor_map_local = factorize(A)

  prime_factor_map.each do |factor, power|
    prime_factor_map[factor] = [power, prime_factor_map_local[factor]].min
  end
end

ans = 1
prime_factor_map.each do |factor, power|
  power.times { ans *= factor }
end

puts ans
```

### 最小公倍数
最大公約数と似ていた。
自作コード

```
n = gets.to_i
ans = Hash.new(0)
n.times do
    divisor = Hash.new(0)
    a = gets.to_i
    i = 2
    while a > 1
        if a % i == 0
            divisor[i] += 1
            a /= i
        else
            i += 1
        end
    end
    divisor[i] += 1 if a != 1
    divisor.each do |i, j|
        ans[i] = j if ans[i] < j
    end
end

answer = 1
ans.each do |i, j|
    answer *= (i**j)
end
puts answer
```

### ゴールドバッハ予想
>全ての 3 よりも大きな偶数は 2 つの素数の和として表すことができる。


エラトステネスのふるいを行ったあとにコードを作成した。<br>
自作コード

```
is_prime = Array.new(100_000, true)
is_prime[0], is_prime[1] = false, false

for i in (2..100_000)
    if is_prime[i] == true
        num = 2
        while i * num <= 100_000
            is_prime[i*num] = false
            num += 1
        end
    end
end

n = gets.to_i
num = (n/2).floor - 100_001

is_end = false
num.downto(-100_000) do |i|
    if is_prime[i] == true
        if is_prime[n-(i+100_001)] == true
            puts i+100_001
            puts n-(i+100_001)
            is_end = true
        end
    end
break if is_end == true
end
```

生成AI<br>
エラトステネスのふるいを使用するのは一緒だが、小さい順から更新している。<br>
可読性が非常に良い。
```
N = gets.to_i

is_prime = Array.new(N + 1, true)
is_prime[0] = false
is_prime[1] = false

(2..N).each do |i|
  if is_prime[i]
    (i * 2).step(N, i) do |j|
      is_prime[j] = false
    end
  end
end

multi = -1
ans = [-1, -1]

(0..N).each do |p|
  if is_prime[p]
    other_prime = N - p
    if is_prime[other_prime]
      if p * other_prime > multi
        multi = p * other_prime
        ans = [p, other_prime]
      end
    end
  end
end

puts ans[0]
puts ans[1]
```

### 中国剰余定理
>m1 と m2 を互いに素な正の整数とする。<br>
Z を m1 で割った余りが b1 であり、Z を m2 で割ったあまりが b2 であるような整数 Z が 0 以上 m1 × m2 未満にただ 1 つ存在する。

<b>modとは？</b><br>
「モジュロ演算」、「剰余演算」と言われる。<br>
下記はaをmで割った余りを表す。
$$a　mod　m$$
例
$$7　mod　3 = 1$$

自作コード
```
m1, m2, b1, b2 = gets.split.map(&:to_i)
is_end = false
(m1*m2-1).downto(0) do |i|
    if i % m1 == b1
        if i % m2 == b2
            puts i
            is_end = true
        end
    end
break if is_end == true
end
```

paiza解説より
>0 以上 m1 × m2 未満の全ての数について m1 , m2 で割った余りが b1 , b2 かどうかを調べると、制約より計算回数が最悪ケースで 10,000,000,000 回となってしまい実行時間制限に間に合いません。<br>
0 以上 m1 × m2 未満の整数のうち、 m1 で割った余りが b1 になるような整数 Z は Z = m1 * i + b1 (0 ≦ i < m2)という形で表すことができ、その個数は m2 個です。<br>
この m2 個の各整数について m2 で割った余りが b2 になるかどうかを調べることでこの問題を最大 100,000　回程度の計算で解くことができます。

上記より、すべての数値を調べるよりZ = m1 * i + b1を調べていく方が圧倒的に計算量は少なくなる。

生成AI
```
m1, m2, b1, b2 = gets.split.map(&:to_i)

(0...m2).each do |i|
  z = m1 * i + b1
  if z % m2 == b2
    puts z
    break
  end
end
```

### paiza予想(問題)
平方数 : 2乗した数値の事

平方数を配列にいれたもの
```
z = 4
count = 2
targets = []
while z <= 100_000_000
    targets << z
    count += 1
    z = count**2
end

puts targets.length
```
解説を読んでみる
>100,000,000 以下の素数は 5,761,455 個存在するため、「予め素数を配列 prime などに列挙しておき、各平方数について 平方数 - prime[i] が素数かどうかで判定する」などの方針だと、実行時間制限に間に合わない可能性があります。<br>
そこで、現時点で反例の見つかっていないゴールドバッハ予想と「素数のうち偶数のものは 2 のみ」という素数の特性を用いた次のような方針を考えてみましょう。<br>
paiza 予想を満たすかどうか調べたい平方数 N について
N が偶数のとき（N の平方根が偶数のとき）
ゴールドバッハ予想より、 N は 2 つの素数の和で表すことができる。<br>
N が奇数のとき（N の平方根が奇数のとき）
2 つの整数の和が奇数になるのは「偶数 + 奇数」の場合のみであり、素数のうち偶数のものは 2 のみである。<br>
よって、N が 2 つの素数の和で表されるとき、「N = 2 + 素数」の形であるので、N - 2 が素数の場合のみ N は paiza 予想を満たす。<br>
この方針で解くと、平方根が奇数である平方数について N - 2 が素数であるかを判定することでこの問題を解くことができます。

上記より自分でコードを作成してみた
```
z = 9
count = 3
targets = []
while z <= 100_000_000
    targets << z
    count += 2
    z = count**2
end

targets.each do |target|
    n = target - 2
    is_end = false
    for i in 2..(n**0.5)+1
        if n % i == 0
            puts target
            is_end = true
            break
        end
        break if is_end == true
    end
end
```

今回の問題で、コードを考える時に、どのようにしたら計算量が少なく解決できるのか柔軟な発想が必要だと再認識した。

## ユークリッドの互除法

最大公約数 = gct (greatest common divisor)と呼ばれる。<br>

自作コード<br>
再帰で実装してみた
```
def Euclid(a, b)
    if a == 0 || b == 0
        puts [a, b].max
    else
        if a >= b
            Euclid(a%b, b)
        else
            Euclid(a, b%a)
        end
    end
end

a, b = gets.split.map(&:to_i)
Euclid(a, b)
```

### 複数の数字のユークリッドの互除法
自作コード
```
n = gets.to_i
a = gets.to_i

def Euclid(a, b)
    if a == 0 || b == 0
        return [a, b].max
    else
        if a >= b
            return Euclid(a % b, b)
        else
            return Euclid(a, b % a)
        end
    end
end

(n-1).times do
    b = gets.to_i
    a = Euclid(a, b)
end

puts a
```

### 最小公倍数
lcm = Least common multipleと略される。<br>
下記の式で簡単に求められる。
$$lcm(A,B) = A×B/gcd(A,B)$$

自作コード
```
def Euclid(a, b)
    if a == 0 || b == 0
        return [a, b].max
    else
        if a >= b
            return Euclid(a % b, b)
        else
            return Euclid(a, b % a)
        end
    end
  end
  
  a, b = gets.split.map(&:to_i)
  puts (a*b) / Euclid(a, b)
```

# a
https://hiraocafe.com/note/euclidtokushukai.html