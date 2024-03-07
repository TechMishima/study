=begin 自分の作成したコード
計算量が圧倒的に多くてダメコード

num = gets.chomp

stop = false
while stop == false do
  num2 = Math.cbrt(num.to_i)
  if num.reverse == num && num2 - num2.floor == 0
    #puts "判定"
    puts num
    stop = true
  end
  num = (num.to_i - 1).to_s
end
=end



#再度解説を見て作成
max = gets.to_i

target = 1
num = 1
answer = 1
while target <= max do
  if target.to_s == (target.to_s).reverse
    answer = target
  end
  num += 1
  target = num * num * num
end

puts answer