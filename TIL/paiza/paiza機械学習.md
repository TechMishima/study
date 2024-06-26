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

## 1-5 scikit learnで学習と予測を行う
### pandas
様々な形式のデータの読み書きを行うことができるライブラリ
```
import pandas as pd
targets_data = pd.read_csv('y_classified.csv') # (CSVファイルのパス)

print(targets_data['Kirishima']) # 出力例
```
### %演算子
```
for i in range(100):
    file = ('images/%03d.png' % (i))
```
繰り返し処理でiは0から99まで増えていく。<br>
'images/%03d.png'の部分については、
- % フォーマット演算子
- 03 幅が3桁で、足りない桁を0で埋める
- d 整数型

上記を表している。<br>
後ろに % (i)がついているので0-99の数値がファイル名に代入される。

### np.empty
```
np.empty((3, 4), int)
```
縦3，横4の空の配列を作成する。intをつけているので整数が入る。

### np.array
```
import numpy as np

# PythonのリストからNumPy配列を作成
my_list = [1, 2, 3, 4, 5]
my_array = np.array(my_list)
```
### scikit-learn
簡単に使用できるPythonの機械学習ライブラリ
```
import sklearn
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

X_train, X_test, y_train, y_test = train_test_split(images_data, targets_data['Kirishima'], random_state=0)
print(X_train.shape)
print(X_test.shape)
print(y_train.shape)
print(y_test.shape)
```
train_test_split関数<br>
モデルを評価するためにデータをトレーニング用とテスト用で分けるための手法。<br>
trainが教師用データ、testがテスト用データの事。<br>
Xには入力する特徴ベクトル、Yには期待する分類結果が入っている。<br>

train_test_splitの後は、
1. Xの特徴データ images_data
2. Yの目的変数(自分で作成した教師データ) targets_data['Kirishima']
3. seed値 random_state=0

上記で成り立っている。

### k-NN
k近傍法<br>
k-NNとは、分類問題を解く教師あり機械学習アルゴリズムの１つ
```
knn = KNeighborsClassifier(n_neighbors=1)
knn.fit(X_train, y_train)
```

出力
```
print(knn.predict(np.array([X_test[0]]))) # 1番目の結果を出力

y_pred = knn.predict(X_test)
print(np.mean(y_pred == y_test)) # 正解率を出力
```
※trueは1として評価、falseは0として評価されるので、平均すると％で正解率をだせる。

## 2-1 話者認識の概要を知ろう
誰が話しているのか認識して分類することができる<br>
新しいライブラリとして、リブロサ(LibROSA)を使用する。<br>

### 重要用語
- SVM(サポートベクターマシン) : 高い精度でパターンを識別できる
- フーリエ変換 : 音声の波形データの変換方法で、どんな周波数の組み合わせでできているかを分析できる
- MFCC : 音声認識によく使われる音声の特徴量

## 2-2 SVMを利用してみよう
### SVMはなぜ使うのか？
テストデータを入れるとデータを分類できる境界線を作成してくれる。
### 散布図の作成
'o'は散布図(〇点)にする意味を持っている。<br>
'x'は散布図(x点)にする意味を持っている。<br>
color='blue'を入力することで、点の色を青に指定できる。<br>
annotate関数はグラフに注釈を入れることができる関数。下記では散布図の点に番号を振っている。sizeの20はテキストの大きさのこと。<br>
```
for i in range(len(train_X)):
    plt.plot(train_X[i][0], train_X[i][1], 'o', color='blue')
    plt.annotate(i, (train_X[i][0], train_X[i][1]), size=20)
```
### SVMで学習する
```
clf = svm.SVC(gamma=0.0001, C=1)
clf.fit(train_X, train_y)
```
ガンマの値が大きい境界線がしなやかになり、領域が狭まる。<br>
逆に小さいと直線的になり、区別が緩くなる。<br>
適切なガンマの値を設定することが、データ分類において重要である。

Cは正則化パラメータと呼ばれる。デフォルトでは1.0<br>
係数にペナルティをかけて、極端な形のグラフをかけないようにする。<br>
主に、膨大なデータを扱い、過学習が発生するときに設定する。<br>

### 決定境界の解読
全体図
```
x = np.linspace(0, 100, 30)
y = np.linspace(0, 100, 30)
yy, xx = np.meshgrid(y, x)
xy = np.vstack([xx.ravel(), yy.ravel()]).T
P = clf.decision_function(xy).reshape(xx.shape)
plt.contour(xx, yy, P, colors='k',
                      levels=[0], alpha=0.5,
                      linestyles=['-'])
```
方眼紙のようなマス目を作成する。<br>
0から100までの範囲で30個で区切る。1マスおよそ3.3のマス目が作成される。<br>
```
x = np.linspace(0, 100, 30)
y = np.linspace(0, 100, 30)
yy, xx = np.meshgrid(y, x)
```
<b>わかりやすいサイトでmeshgrid関数を勉強する</b>
https://disassemble-channel.com/np-meshgrid/<br>
meshgridは2つの変数が返り値として返ってくる<br>
格子点を作成するための関数である<br>
どのようにして使われているのか？

値は別に管理したい時に使用する。<br>
2次元配列だと1つの値しか管理できない？
```
xy = np.vstack([xx.ravel(), yy.ravel()]).T
```
xx,yyを組み合わせて格子点にしていく。<br>
np.vstackは結合するための関数であり、xx.ravel(), yy.ravel()を合わせる<br>
ravelは1次元配列にする役割を持っている。xx,yyは2次元配列なので1次元配列に変換するために使用する。<br>
.Tは、行列や配列の転置（transpose）を行うための属性。転置とは、行と列を入れ替える操作のこと。<br>
<b>T属性の使い方</b><br>
```
import numpy as np

a_2d = np.arange(6).reshape(2, 3)
print(a_2d)
# [[0 1 2]
#  [3 4 5]]

a_2d_T = a_2d.T
print(a_2d_T)
# [[0 3]
#  [1 4]
#  [2 5]]
```
決定関数
```
P = clf.decision_function(xy).reshape(xx.shape)
```
clf.decision_function(xy) : 与えられた格子点 xy 上で SVM モデル clf の決定関数を評価する。<br>
上記で境界線のデータを作成する。

.reshape(xx.shape) : 上記だけだと1次元になってしまう。今回は2次元配列なので、reshapeでxxを指定することで2次元配列に変換することができる。

```
plt.contour(xx, yy, P, colors='k',
                      levels=[0], alpha=0.5,
                      linestyles=['-'])
```
plt.contour関数は、等高線を可視化するために使用する。

- xx：x座標を表す2次元配列
- yy：y座標を表す2次元配列
- P：決定関数の値を表す2次元配列
- colors='k'：等高線の色を黒に設定
- levels=[0]：等高線のレベルを設定。ここでは、決定関数の値が0の等高線のみをプロット。
- alpha=0.5：等高線の透明度を設定。ここでは、半透明の線を描画。
- linestyles=['-']：等高線のスタイルを設定。ここでは、実線を指定。

### 等高線について
Pythonで等高線をmatplotlibで描画してみよう！【初心者必見】<br>
https://www.sejuku.net/blog/78323

等高線とは高さを平面で表した線のこと<br>
データ分析で使用されることが多い。

平方根の計算
```
import numpy as np
arr = np.array([1, 4, 9, 16, 25])
sqrt_arr = np.sqrt(arr)
```

## 2-3 話者認識に利用する音声データを確認しよう

### 音声データについて
高い音声と低い音声だと、低い音声の波形の方が荒い<br>
時間当たりの振動が多いと高い音になる<br>
時間当たりの振動が少ない（波がゆるやか）だと低い音になる

### 音声データを波形のグラフにする

```
import librosa
import librosa.display
import matplotlib.pyplot as plt

a, sr = librosa.load('sample/hi.wav')
librosa.display.waveplot(a, sr)
plt.show()
```
波形データは a に、サンプリングレートは sr に格納される。
- a(波形データ) : 音声を時間軸と振幅の 2 次元グラフで表したもの。
- sr(サンプリングレート) : 1秒間のサンプル数を表したもの。音声のクオリティに影響する。

6秒の音声の場合、サンプリングレート*6で音声データのフレーム数がわかる。len(a)

### グラフを詳しくみる（時間の範囲設定）
```
a, sr = librosa.load('sample/lo.wav')
librosa.display.waveplot(a[0:100], sr)
plt.show()
```
a[0:100]で0~100フレームまでを確認できる

## 2-4 そのままの音声データで学習と予測してみよう

### 音声データをそのまま使うのはNG
そのままだと正解率が低く、正常に学習したとは言えない<br>
なぜなのか？
音声データは波のデータである。話すタイミングが違うだけで全く反対の結果を出してしまう。<br>
適切なデータに加工してから学習させる必要がある。

### コードを読んでみる
```
import os
```
Python の標準ライブラリで、osと対話を行うための機能を追加する。<br>
ファイルやディレクトリの操作、環境変数の取得などができる。

```
.format

name = "John"
age = 30
message = "My name is %s and I am %d years old." % (name, age)
print(message)
```
formatメソッドは動的に値を組み込むことができるメソッド。<br>
％演算子に似ている。
```
dir_name = 'voiceset'
for file_name in sorted(os.listdir(path=dir_name)):
```
osモジュールを使用して繰り返し処理を行っている。<br>
取り出したファイルはfile_nameとして命名している。なんでもOK<br>
os.listdir()関数は、ディレクトリ内のファイルを返すために使用される。<br>
引数を設定しなかった場合は、現在のディレクトリが指定される。<br>
今回は、voicesetを指定したいため、path=で指定している。

<b>os.listdir()関数をふかぼり</b>
```
# listdir()関数 指定したディレクトリ内のファイルを取得

# 現在のディレクトリを取得
import os

files = os.listdir()
print(files)

# 指定したディレクトリを取得
import os

desktop_path = '/path/to/desktop'
files = os.listdir(desktop_path)
print(files)

# 現在のディレクトリの中に指定したいディレクトリ(sub)がある場合
import os

files = os.listdir(path='sub')
print(files)
```

os.path.join

```
a, sr = librosa.load(os.path.join(dir_name, file_name))
```
a, sr = librosa.load('パス')で音声データを読み込む<br>
繰り返し処理でパスを取得したいのでos.path.joinを使用する<br>
os.path.joinを使用するとvoicesetとファイル名を組み合わせることができる。

<b>os.path.joinをふかぼり</b><br>
ディレクトリ名やファイル名などのパーツをつなぎ合わせて、有効なパスを生成するための関数。<br>
主にディレクトリの区切り文字の適切な処理を行うために使用される。<br>

Windowsではディレクトリの区切り文字がバックスラッシュ \ で表されるが、<br>
Unix系のシステム（LinuxやmacOSなど）ではスラッシュ / が使われる。<br>
適切なパスを設定するためにpath.joinを使用する。

```
# 特徴量と分類のラベル済みのラベルの組を返す
def get_data(dir_name):
    data_X = []
    data_y = []
    for file_name in sorted(os.listdir(path=dir_name)):
        print("read: {}".format(file_name))
        speaker = file_name[0:file_name.index('_')]
        data_X.append(get_feat(os.path.join(dir_name, file_name)))
        data_y.append((speakers[speaker], file_name))
    return (np.array(data_X), np.array(data_y))

data_X, data_y = get_data('voiceset')
```

```
speaker = file_name[0:file_name.index('_')]
```
.index('_')はかっこの中にある文字までどのぐらいかを返す<br>
"belevskaya_06_su.wav"の場合だと10を返す<br>
そしてfile_name[0:10]になるので、belevskayaが返される

```
ok_count += 1 if actual == expected else 0
```
一行でifとelseを使うことができる。


## 2-5 フーリエ変換を利用して予測の精度を改善しよう
### 予測精度を向上させる （パワースペクトル
どんな周波数で構成されているのかを、フーリエ変換を用いて予測する。<br>

フーリエ変換って？<br>
元の波形をフーリエ変換を用いることで、周波数ごとに分解することができる。<br>
周波数ごとに集計したパワースペクトルを確認することで、特徴量をより良いものにすることができる<br>

この方法のデメリット<br>
特徴量の多さが精度を上げるが、もしデータが一つで長い音声であった場合だと、集計できるスペクトルは１つだけになってしまう。<br>
改善するとすれば、長い音声を区切ってあげることによって、特徴量を増やしてあげることができる。

### コードを読んでみる

```
from scipy import fftpack
```
フーリエ変換の計算機能を提供するモジュール。<br>
Fast Fourier Transform（FFT）: 高速フーリエ変換

```
# 特徴量を返す
def get_feat(file_name):
    a, sr = librosa.load(file_name)
    fft_wave = fftpack.rfft(a, n=sr)
    fft_freq = fftpack.rfftfreq(n=sr, d=1/sr)
    y = librosa.amplitude_to_db(fft_wave, ref=np.max)
    plt.plot(fft_freq, y)
    plt.show()
    return y
```
- fftpack.rfft() : 音声データのFFT（高速フーリエ変換）を計算。n=srはFFTの点数をサンプリングレートと同じに設定
- fftpack.rfftfreq : FFT結果の周波数軸を取得。n=srはFFTの点数、d=1/srは各周波数ビンの幅を指定
- librosa.amplitude_to_db() : FFT結果をデシベルスケールに変換。ref=np.maxは変換の基準となる振幅を指定

### フーリエ変換を学習
https://www.youtube.com/watch?v=fGos3wrKeHY<br>
複雑な波の波形でも、様々な周波数の波の集まりであるので、それを分解してあげるのがフーリエ変換である。<br>
フーリエ変換を行うことでノイズをなる周波数を消してほぼ逆の逆フーリエ変換をすることもできる。<br>

## 2-6 音声の時間別の特徴量を利用して予測の精度を改善しよう
予測の精度をあげるために、MFCCを利用していく<br>
短時間フーリエ変換を利用する<br>
パワースペクトルの時間による変化の事を、パワースペクトルグラムという<br>

mfccを利用すると高い確率で音声を予測をすることができる。