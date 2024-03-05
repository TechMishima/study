# ToDo
機械学習講座の受講<br>
https://paiza.jp/works/ai_ml/primer

# 参考リンク
Numpy<br>
https://numpy.org/

# TIL
## 1-1 機械学習の概要を知ろう
### 問題解決
- 分類 ・・・ 選択肢から答えを予測する問題
- 回帰分析 ・・・ 数値を予測する問題

### 学習方法
- 教師あり学習 ・・・ 教師データ(入力に対する回答例)をヒントに学習<br>
(例)写真の分類であればいくつかの写真、気温の予測であれば過去の気温データ
- 教師なし学習 ・・・ 予測するべきことがあらかじめ決まっていない<br>
(例)クラスタリング(顧客を法則を作って3グループに分ける)

### ツールについて
- Jupyter Notebook ・・・ pythonの実行環境
- Matplotlib ・・・ グラフ描画のライブラリ
- NumPy ・・・ 数値計算ライブラリ
- Pandas ・・・ 様々な形式のデータの入出力ライブラリ
- OpenCV ・・・ 画像処理ライブラリ
- scikit-learn ・・・ 機械学習ライブラリ

## 1-2 JupyterNotebookについて
### Numpyについて
数値計算のライブラリ<br>
ランダムな整数列を作成するには？
```
import numpy as np

np.random.seed(シード値)
y = np.random.randint(整数値の下限, 整数値の上限, 整数の個数)
print(y)
```
arange関数
```
import numpy as np

# 0から4までの整数を生成 (stopは含まれない)
arr1 = np.arange(5)
print(arr1)  # Output: [0 1 2 3 4]

# 2から9までの整数を生成 (stopは含まれない)
arr2 = np.arange(2, 10)
print(arr2)  # Output: [2 3 4 5 6 7 8 9]

# 1から10までの整数を2刻みで生成 (stopは含まれない)
arr3 = np.arange(1, 11, 2)
print(arr3)  # Output: [1 3 5 7 9]
```

### グラフを描画する
```
import matplotlib.pyplot as plt

plt.plot(x軸の配列, y軸の配列)
plt.show()
```


### JupyterNotebookの使い方
ターミナルに入力
```
jupyter notebook
```
ノートの保存は、Jupyter Notebook画面の上側にある「File」をクリックし、「Save and Checkpoint」をクリックします。

### JupyterNotebookのインストール
Anacondaをインストールするとデフォルトで入っている。<br>
https://ai-inter1.com/python-install/#st-toc-h-2<br>
https://www.anaconda.com/download/

# 1-3 問題と入出力データを考えよう