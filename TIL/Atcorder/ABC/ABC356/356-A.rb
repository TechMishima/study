# study/TIL/Atcorder/ABC/ABC356

n, l, r = gets.split.map(&:to_i)

line = []
n.times do |i|
  line << i + 1
end

start_index = l - 1
end_index = r - 1
# 指定範囲を逆にする
reversed_subarray = line[start_index ..end_index].reverse

# 元の配列の範囲を置き換える
line[start_index..end_index] = reversed_subarray

puts line