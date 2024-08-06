# ToDo
RubyOnRailsとPythonの連携をする。<br>
機械学習の結果をRailsで表示することを目標にする。

# Progress
- 簡単な計算をPythonにさせる。

# TIL

## 簡単なRubyとPythonの連携
ruby
```
# add_numbers.rb
puts "Enter the first number:"
number1 = gets.chomp

puts "Enter the second number:"
number2 = gets.chomp

# Pythonスクリプトを呼び出す
result = `python3 add_numbers.py #{number1} #{number2}`

# 結果を表示
puts "The sum is: #{result}"
```

python
```
# add_numbers.py
import sys

# コマンドライン引数を取得
number1 = float(sys.argv[1])
number2 = float(sys.argv[2])

# 数値を足し合わせる
result = number1 + number2

# 結果を出力
print(result)
```

### RubyコードでPythonスクリプトを実行したい場合

バックティックで囲むと他言語のスクリプトを実行することができる。<br>
引数の設定を行う場合は#{}で囲んであげる。
```
result = `python3 add_numbers.py #{number1} #{number2}`
```
pythonコード<br>
sysライブラリをインポートする。<br>
sys.argvで引数を使用する。<br>
1から始まるので注意。0は実行したpythonスクリプトの名前が格納されている。<br>
printで結果を出力しているが、rubyでコマンドラインを使用するときは、結果の出力がrubyに渡されるので記述している。

```
import sys

number1 = float(sys.argv[1])
number2 = float(sys.argv[2])

result = number1 + number2

print(result)
```