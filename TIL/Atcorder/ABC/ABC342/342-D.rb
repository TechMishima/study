# 0は平方数になる
N = gets.to_i
line = gets.split.map(&:to_i)

num1 = 0
answer = 0
while num1 < N do
  num2 = num1 + 1
  while num2 < N do
    #puts num1.to_s + " " + num2.to_s
    pd = line[num1] * line[num2]
    target = Math.sqrt(pd)
    if target - target.floor == 0
      answer += 1
    end
    num2 += 1
  end
  num1 += 1
end

puts answer