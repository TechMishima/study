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

## 1-3 問題と入出力データを考えよう
### 教師データの作成
1. csvファイルの作成
2. 1行目は何を分類するのか記述する
3. 2行目からは分類する<br>
(例)写真の分類で、人が写っていたら1を、写っていなかったら0で分類する。
```
id,Person
0,1
1,0
2,1
```

## 1-4 画像から特徴量を抽出しよう
### 画像データとは？
細かいピクセルの集合体<br>
(R,G,B) 赤、緑、青の値で構成される。

### グレースケール画像とは？
1ピクセルを明るさの単位だけで表せる画像データ。

### 画像データをグレースケール画像にする方法
```
import cv2

img = cv2.imread(元画像のパス, cv2.IMREAD_GRAYSCALE)
cv2.imwrite(グレースケール画像のパス, img)
```
例
```
import cv2

img = cv2.imread('images/000.png', cv2.IMREAD_GRAYSCALE)
cv2.imwrite('gray000.png', img)

print(img) # 画像を特徴ベクトルが含まれている配列に変換できる。
```

### 分類の方法
画像データを特徴ベクトルと呼ばれる、特徴を数値化したものを比較することで分類する。

### shape属性
shapeはNumPyやOpenCVなどの多次元配列の属性である。<br>
配列の各次元において、要素を返す。<br>
画像データの場合は(行、列)で返される。
```
import cv2

img = cv2.imread('images/000.png', cv2.IMREAD_GRAYSCALE)
print(img.shape)
```

### ravel関数
ravelはNumPyやOpenCVなどの多次元配列の関数である。<br>
多次元配列を1次元配列にすることができる。
```
import cv2

img = cv2.imread('images/000.png', cv2.IMREAD_GRAYSCALE)
print(img.ravel())
```

### ヒストグラムの作成
```
import cv2
import numpy as np
from matplotlib import pyplot as plt

# ヒストグラムを描画
def plot_hist(img):
    img_hist = np.histogram(img.ravel(), 256, [0, 256])
    hist = img_hist[0]
    plt.bar(np.arange(256), hist)
    plt.show()

plot_hist(cv2.imread(ヒストグラムを表示する画像のパス, cv2.IMREAD_GRAYSCALE))
```
上記で作成できる。
```
import cv2
import numpy as np
from matplotlib import pyplot as plt
```
必要なモジュールをインポートする。<br>
from matplotlib import pyplot as pltは<br>
import matplotlib.pyplot as pltと同じ。
```
img_hist = np.histogram(img.ravel(), 256, [0, 256])
```
histogram関数は下記を入力する。
- ヒストグラムにしたいデータ
- ビンの数の指定。一つの区切りの数（デフォルトでは10）
- ヒストグラムの範囲の大きさ

上記だと img.ravel()のデータを256の区切りで0から255の範囲でヒストグラムを作成する。
```
hist = img_hist[0]
```
返り値は、ヒストグラムの度数分布と、ビンの端の位置の２つを返す。<br>
img_hist[0]がヒストグラムの度数分布にあたるので変数に入れる。
```
plt.bar(np.arange(256), hist)
plt.show()
```
棒グラフにして表示する。

# 1-5 scikit learnで学習と予測を行う