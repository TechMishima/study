n, m = gets.split.map(&:to_i) # n:宇宙人の数 m:消毒液の能力
menbers = gets.split.map(&:to_i) # 宇宙人の手

ans = 0 # 答え
num = 0 # 消毒に必要な数
n.times do |i|
  num += menbers[i]
  if num <= m
    ans += 1
  else
    break
  end
end

puts ans