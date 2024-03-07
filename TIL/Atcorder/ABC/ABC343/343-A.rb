# 標準入力
A, B = gets.split.map(&:to_i)

# 出力
target = A + B
stop = false
while stop == false do
  num = rand(0..9)
  if num != target
    puts num
    stop = true
  end
end