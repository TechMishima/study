class PostsController < ApplicationController

  def index
    @posts = Post.all

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

end
