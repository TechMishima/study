# ToDo
rumaleの学習<br>
https://qiita.com/kojix2/items/069a45ebb1104ff4256c<br>
https://github.com/yoshoku/rumale<br>

# TIL

## インストール

### gemをインストール
gemfileに記載
```
gem "rumale"
```
ターミナルで実行
```
bundle install
```

## マニュアルの確認
https://yoshoku.github.io/rumale/doc/<br>

### 自分で最新を確認する方法
gemfileに記載
```
gem "yard"
```
ターミナルで実行
```
bundle install
bundle exec yard server -gd
```
ローカルサーバーに接続
```
http://localhost:8808
```

## お試しで実行 k-近傍法
### 参考元
下記をRailsで実行してみる
```
require 'rumale'

ruby_labels = Rubyの配列
#  [0,0,0,0,0,1,1,1,1,1,2,2,2,2,2] など
ruby_samples = Rubyの配列
#  [[sample_1], [sample_2], [sample_3], .. [sample_n]] など

# NArrayへの変換
labels = Numo::Int32.cast(ruby_labels)
amples = Numo::DFloat.cast(ruby_samples)

# データ前処理
# ラベルのエンコーディング、サンプルの正規化など

# モデルの作成
model = Rumale::NearestNeighbors::KNeighborsClassifier.new
model.fit(samples, labels)

# 予想
model.predict(new_samples)

# 評価
puts model.score(test_samples, testl_labels)
```
### 雑でもよいので実行してみる
コントローラーに記述<br>
一応実行して可能
```
def index
  require 'rumale'
  require 'numo/narray'

  ruby_labels = [0,0,0,0,0,1,1,1,1,1,2,2,2,2,2]
  ruby_samples = [[1.0], [1.1], [1.2], [1.3], [1.4], [2.0], [2.1], [2.2], [2.3], [2.4], [3.0], [3.1], [3.2], [3.3], [3.4]]

  labels = Numo::Int32.cast(ruby_labels)
  samples = Numo::DFloat.cast(ruby_samples)

  # データ前処理
  # ラベルのエンコーディング、サンプルの正規化など

  # モデルの作成
  model = Rumale::NearestNeighbors::KNeighborsClassifier.new
  model.fit(samples, labels)

  # 予測
  new_samples = [[1.5], [2.5], [3.5]]  # 予測したい新しいサンプル
  predictions = model.predict(Numo::DFloat.cast(new_samples))
  # puts "Predictions: #{predictions.to_a}"
  @predictions = predictions.to_a

  # 評価
  test_samples = [[1.1], [2.1], [3.1]]  # テスト用サンプル
  test_labels = [0, 1, 2]  # テスト用ラベル
  score = model.score(Numo::DFloat.cast(test_samples), Numo::Int32.cast(test_labels))
  # puts "Score: #{score}"
  @score = score
end
```
### サービスクラスを作成して連携してみる
機械学習はコントローラの役割ではないため、可読性が悪くなってしまう。<br>
サービスクラスを作成して分けるべきなので、考えてみる。

## k-近傍法
```
  require 'rumale'
  require 'numo/narray'

  ruby_labels = [0,0,0,0,0,1,1,1,1,1,2,2,2,2,2]
  ruby_samples = [[1.0], [1.1], [1.2], [1.3], [1.4], [2.0], [2.1], [2.2], [2.3], [2.4], [3.0], [3.1], [3.2], [3.3], [3.4]]
  
  labels = Numo::Int32.cast(ruby_labels)
  samples = Numo::DFloat.cast(ruby_samples)

  # モデルの作成
  model = Rumale::NearestNeighbors::KNeighborsClassifier.new
  model.fit(samples, labels)

  # 予測
  new_samples = [[1.5], [2.5], [3.5]]  # 予測したい新しいサンプル
  predictions = model.predict(Numo::DFloat.cast(new_samples))
  # puts "Predictions: #{predictions.to_a}"
  @predictions = predictions.to_a

  # 評価
  test_samples = [[1.1], [2.1], [3.1]]  # テスト用サンプル
  test_labels = [0, 1, 2]  # テスト用ラベル
  score = model.score(Numo::DFloat.cast(test_samples), Numo::Int32.cast(test_labels))
  # puts "Score: #{score}"
  @score = score
```