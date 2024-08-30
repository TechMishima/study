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

## NArray
https://qiita.com/kojix2/items/0bc5efda0f65e58693a0<br>
Python3でいうNumpyに似たツール。<br>
rubyの行列計算ライブラリ。

### NArrayの型
- 符号付き整数
  - Numo::Int8
    - 8ビット符号付き整数(-128 から 127)
  - Numo::Int16
    - 16ビット符号付き整数(-32,768 から 32,767)
  - ※(よく使う)Numo::Int32
    - 32ビット符号付き整数(-2,147,483,648 から 2,147,483,647)
  - Numo::Int64
    - 64ビット符号付き整数(-9,223,372,036,854,775,808 から 9,223,372,036,854,775,807)

- 符号なし整数
  - Numo::UInt8
    - 8ビット符号なし整数(0 から 255)
  - Numo::UInt16
    - 16ビット符号なし整数(0 から 65,535)
  - Numo::UInt32
    - 32ビット符号なし整数(0 から 4,294,967,295)
  - Numo::UInt64
    - 64ビット符号なし整数(0 から 18,446,744,073,709,551,615)

- 実数
  - Numo::SFloat (Single Float)
    - 32ビット浮動小数点数(約 3.4E-38 から 3.4E+38、小数点以下約7桁の精度)
  - ※(よく使う)Numo::DFloat (Double Float)
    - 64ビット浮動小数点数(約 1.7E-308 から 1.7E+308、小数点以下約15桁の精度)

- 複素数
  - Numo::SComplex
    - 32ビット複素数 (Single Complex, 16ビットの実数部と16ビットの虚数部)
  - Numo::DComplex
    - 64ビット複素数 (Double Complex, 32ビットの実数部と32ビットの虚数部)

- その他
  - Numo::RObject
      -Rubyオブジェクト(任意のRubyオブジェクトを格納できるデータ型。数値以外のデータを扱う場合や、異なるデータ型を混在させたい場合に使用される。ただし、数値計算には向いていない。)