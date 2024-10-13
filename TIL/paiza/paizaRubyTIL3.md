# ToDo
学習したことのアウトプット

# Til
### 小数点以下の扱い
四捨五入 round
```
100.3333.round # 出力結果 ==> 100
100.3333.round(1) # 出力結果 ==> 100.3
```
小数点以下切り上げ ceil
```
100.3333.ceil # 出力結果 ==> 101
100.3333.ceil(1) # 出力結果 ==> 100.4
```
小数点以下切り捨て floor
```
100.3333.floor # 出力結果 ==> 100
100.3333.floor(1) # 出力結果 ==> 100.3
```

## 配列が空で条件分岐する
```
if arr == []
  puts "配列は空です"
```
nilではないので注意！

## delete#at
指定された位置にある要素を取り除きそれを返す。
```
array = [0, 1, 2, 3, 4]
target = array.delete_at 2
puts target  # => 2
p array      # => [0, 1, 3, 4]
```

## insert
要素の挿入
```
ary = [1, 2, 3]
ary.insert(2, "a", "b")
p ary                  # => [1, 2, "a", "b", 3]
ary.insert(-2, "X")
p ary                  # => [1, 2, "a", "b", "X", 3]
```

## downto
https://uxmilk.jp/24052<br>
timesと似ている
```
5.downto(1) {|i| print i, " " } # => 5 4 3 2 1
```
```
obj.downto(min){|int|
 "繰り返し実行する処理"
}
#又は
obj.downto(min) do |int|
 "繰り返し実行する処理"
end
```
## upto
```
obj.upto(max){|int|
  "繰り返し実行する処理"
}
#又は
obj.upto(max) do |int|
 "繰り返し実行する処理"
end
```

## ハッシュに配列を入れたい！
ハッシュに配列を作成しようとしても同一オブジェクトの配列を作成してしまう。なぜなのか
>Hash.new(0): これは各キーに対して独立したスカラー値 0 を提供するため、+= 1 のような操作が意図したとおりに動作します。<br>
Hash.new([]): これはキーが存在しない場合に同一の配列を返すため、意図しない共有が発生します。この共有が原因で、思わぬ挙動が見られることがあります。

>hash = Hash.new { |h, k| h[k] = [] }を使用することで解決ができる

```
hash1 = Hash.new(0)
hash1[1] += 1
hash1[1] += 1
p hash1[1]  # => 2
p hash1[2]  # => 0


hash2 = Hash.new([])
hash2[1] << 1
hash2[1] << 2
p hash2[1]  # => [1, 2]
p hash2[2]  # => [1, 2]


hash3 = Hash.new { |h, k| h[k] = [] }
hash3[1] << 1
hash3[1] << 2
p hash3[1] # => [1, 2]
p hash3[2] # => []
```

## ハッシュのeachメソッドでは取り出した値が変わる？

下記は配列として出力され、:aの値,1の値になる。<br>
キーを取り出すときはa[0]、値を取り出すときはa[1]となる。<br>
```
{:a=>1, :b=>2}.each {|a| p a}
#=> [:a, 1]
#   [:b, 2]
```

下記はキーとシンボルとして取り出すことができる。<br>
値を取り出すときはv、キーを取り出すときはkになる。<br>
こっちの方が扱いやすそう。
```
{:a=>1, :b=>2}.each {|k, v| p [k, v]}
#=> [:a, 1]
#   [:b, 2]
```

## include?メソッド

含まれているか判定して真偽値で返してくれるメソッド

```
"hello".include?("ell") # => true
[1, 2, 3].include?(2)   # => true
```

## 様々な真偽値を返すメソッド

### empty?メソッド 空かどうか判定
```
[].empty?       # => true
"".empty?       # => true
[1, 2, 3].empty? # => false
```

### nil? nilかどうか判定
```
nil.nil?        # => true
"hello".nil?    # => false
```

### start_with? 特定の文字列で始まるか判定
```
"hello".start_with?("he") # => true
"hello".start_with?("lo") # => false
```

### end_with? 特定の文字列で終わるか判定
```
"hello".end_with?("lo")   # => true
"hello".end_with?("he")   # => false
```

### all? 配列の全ての要素が特定の条件を満たすか判定
```
[1, 2, 3].all? { |n| n > 0 } # => true
[1, 2, 3].all? { |n| n > 1 } # => false
```

### any? 配列の中に少なくとも1つの要素が特定の条件を満たすか判定
```
[1, 2, 3].any? { |n| n > 2 } # => true
[1, 2, 3].any? { |n| n > 3 } # => false
```

### none? 配列の中に特定の条件を満たす要素が1つもないか判定
```
[1, 2, 3].none? { |n| n > 3 } # => true
[1, 2, 3].none? { |n| n > 2 } # => false
```

### one? 配列の中に特定の条件を満たす要素がちょうど1つだけあるか判定
```
[1, 2, 3].one? { |n| n == 2 } # => true
[1, 2, 3].one? { |n| n > 1 }  # => false
```

### has_key? ハッシュに特定のキーが含まれているか判定
```
hash = {a: 1, b: 2}
hash.has_key?(:a)  # => true
hash.has_key?(:c)  # => false
```

### has_value? ハッシュに特定の値が含まれているか判定
```
hash = {a: 1, b: 2}
hash.has_value?(1)  # => true
hash.has_value?(3)  # => false
```

### member? ハッシュやセットに特定のキーや要素が含まれているか判定
```
{a: 1, b: 2}.member?(:a) # => true
{a: 1, b: 2}.member?(:c) # => false
```

### match? 文字列が特定の正規表現にマッチするか判定
```
"hello".match?(/ell/) # => true
"hello".match?(/abc/) # => false
```

### even? 数値が偶数か判定
```
4.even?  # => true
5.even?  # => false
```

### odd? 数値が奇数か判定
```
4.odd?  # => false
5.odd?  # => true
```

### zero? 数値がゼロか判定
```
0.zero?  # => true
1.zero?  # => false
```

### between? 数値が特定の範囲内にあるか判定
```
5.between?(1, 10)  # => true ※1-10の範囲
5.between?(6, 10)  # => false ※6-10の範囲
'cat'.between?('ant', 'dog')  # => true
'gnu'.between?('ant', 'dog')  # => false
```

### eql? オブジェクトが同じ値を持つか判定（型も考慮）
```
5.eql?(5)      # => true
5.eql?(5.0)    # => false
```

### equal? オブジェクトが同一のものであるか判定
```
a = "hello"
b = a
c = "hello"
a.equal?(b)  # => true
a.equal?(c)  # => false
```

### frozen? オブジェクトが凍結されているか判定
```
str = "hello"
str.frozen?  # => false
str.freeze
str.frozen?  # => true
```

### respond_to? オブジェクトが特定のメソッドに応答できるか判定
```
"hello".respond_to?(:upcase)  # => true
"hello".respond_to?(:nonexistent_method)  # => false
```

### instance_of? オブジェクトが特定のクラスの直接のインスタンスか判定
```
class Animal; end
class Dog < Animal; end

dog = Dog.new
dog.instance_of?(Dog)     # => true
dog.instance_of?(Animal)  # => false
dog.instance_of?(Object)  # => false
dog.instance_of?(String)  # => false
```

### is_a? オブジェクトが特定のクラス,またはそのサブクラスのインスタンスか判定
```
class Animal; end
class Dog < Animal; end

dog = Dog.new
dog.is_a?(Dog)     # => true
dog.is_a?(Animal)  # => true
dog.is_a?(Object)  # => true
dog.is_a?(String)  # => false
```

### kind_of? オブジェクトが特定のクラスまたはそのサブクラスのインスタンスか判定
```
"hello".kind_of?(Object)  # => true
123.kind_of?(Numeric)     # => true
```

## combinationメソッド
重複しない組み合わせを作成するときに使用できるメソッド
```
a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]]: one combination of length 0
a.combination(5).to_a  #=> []  : no combinations of length 5
```

## combination + each
1～3個の組み合わせのeachの実装

```
arr = [1, 2, 3, 4]

(1..3).each do |i|
    arr.combination(i).each do |comb|
        p comb
    end
end
```

## sumメソッド(ブロックの使い方)

```
arr = [[1, 2], [3, 4]]

puts arr.sum {|item| item[0]} # 4
puts arr.sum {|item| item[1]} # 6
```

## トポロジカルソート

### トポロジカルソートとは？

オブジェクト間に依存関係がある場合、どんな順番に並べるか良いかを決めるアルゴリズムの事。<br>
オブジェクト間に依存関係がある・・・有向非巡回グラフ(DAG)の事。<br>
DAGとは、ある頂点vから出発し、辺をたどり、頂点vに戻ってこないグラフである。

### 入次数とは？

次数は、グラフの頂点に接合する辺の数を表している。<br>
有向グラフでは、頂点に入ってくる辺数を入次数、頂点から出ていく辺数を出次数と呼ぶ。

### トポロジカルソートの実装

1. 与えられた比較結果を元に関係をDAGに変換する。
2. 入次数の計算を行う。
3. 入次数が0の頂点を配列に追加する。
4. 取り出した頂点の出次数に対応する辺を削除する。
5. 3と4の手順を比較結果がなくなるまで繰り返す。

### コード

```
def topological_sort(n, edges)
  # 入次数を格納する配列
  in_degree = Array.new(n + 1, 0)
  graph = Array.new(n + 1) { [] }

  # グラフの構築
  edges.each do |u, v|
    graph[u] << v
    in_degree[v] += 1
  end

  # 入次数が0の頂点をキューに追加
  queue = []
  (1..n).each do |i|
    queue << i if in_degree[i] == 0
  end

  # トポロジカルソートの結果を格納するリスト
  result = []

  # トポロジカルソートの実行
  while !queue.empty?
    # キューに2つ以上の要素があると順序が一意に決まらない
    return -1 if queue.size > 1

    node = queue.shift
    result << node

    # 隣接する頂点の入次数を減らし、入次数が0になればキューに追加
    graph[node].each do |neighbor|
      in_degree[neighbor] -= 1
      queue << neighbor if in_degree[neighbor] == 0
    end
  end

  # 全ての頂点を訪問できたか確認
  if result.size == n
    result
  else
    -1
  end
end

# 入力の受け取り
n, m = gets.split.map(&:to_i)
edges = m.times.map { gets.split.map(&:to_i) }

# トポロジカルソートの結果を出力
result = topological_sort(n, edges)
if result == -1
  puts -1
else
  puts result.join(' ')
end
```

### コード解説

1. グラフの作成

edges に含まれる各辺情報 (u, v) をループで処理し、グラフ graph を構築する。<br>
graph[u] << v によって u から v への有向辺を追加し、
同時に in_degree[v] をインクリメントして、頂点 v の入次数を1増やす。<br>
これにより、頂点 u から v への関係を構築している。

```
n, m = gets.split.map(&:to_i)
edges = m.times.map { gets.split.map(&:to_i) }

def topological_sort(n, edges)

  # 入次数を格納する配列
  in_degree = Array.new(n + 1, 0)
  graph = Array.new(n + 1) { [] }

  # グラフの構築
  edges.each do |u, v|
    graph[u] << v
    in_degree[v] += 1
  end
```

2. 入次数の計算

in_degree という配列を初期化し、各頂点（鉱物）が何本の辺を受け取っているか（入次数）を0に初期化している。<br>
その後、上記のグラフ作成部分で in_degree[v] += 1 によって実際の入次数が計算されている。

```
  # 入次数の計算 (グラフの構築の途中)
    in_degree[v] += 1
```

3. 入次数が0の頂点をキューに追加

頂点 1から n までをループし、入次数が0の頂点を queue に追加している。<br>
入次数が0の頂点は、他の頂点から依存されていないため、先頭であることが確定している。

```
  # 入次数が0の頂点をキューに追加
  queue = []
  (1..n).each do |i|
    queue << i if in_degree[i] == 0
  end
```

4. トポロジカルソートの実行 (出次数の減算とstep3の繰り返し)

queue.shift でキューの先頭から頂点を取り出し、結果リスト result に追加する。<br>
graph[node].each によって、現在の node から出る辺を調べ、その隣接するneighborの入次数を1減らします。<br>
neighborの入次数が0になれば、その頂点をキューに追加します。これを全ての頂点が処理されるまで繰り返します。<br>
キューのサイズが2以上の場合、一意の順序を決定できないため、-1 を返して終了します。

```
  # トポロジカルソートの結果を格納するリスト
  result = []

  # トポロジカルソートの実行
  while !queue.empty?
    # キューに2つ以上の要素があると順序が一意に決まらない
    return -1 if queue.size > 1

    node = queue.shift
    result << node

    # 隣接する頂点の入次数を減らし、入次数が0になればキューに追加
    graph[node].each do |neighbor|
      in_degree[neighbor] -= 1
      queue << neighbor if in_degree[neighbor] == 0
    end
  end
```

5. 一意性のチェック(キューに複数の頂点がない)

キューに複数の頂点が存在する場合、複数の可能な順序があるため、順序が一意に決まらない。<br>
この時点で順序が複数あることが判明したため、-1 を返して終了する。

```
# (トポロジカルソートの途中)
return -1 if queue.size > 1
```

6. サイクルのチェック

result に追加された頂点の数が n に等しければ、全ての頂点が処理されたことが保証される。<br>
もし result.size != n であれば、サイクルが存在し、正しい順序を決定することができないため、-1 を返す。

```
if result.size == n
  result
else
  -1
end
```