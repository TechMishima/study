cards = []
100.times do |i|
  cards << {:num => i + 1, :face => false}
end

#n番目のカード
n = 2
m = 0
num = []
while n <= 100
  m = n
  while m <= 100
    num << m
    m += m
  end

  # カードを裏返す
  num.each do |i|
    if cards[i - 1][:face] == false
      cards[i - 1][:face] = true
    else
      cards[i - 1][:face] = false
    end
  end
n += 1
end

# 裏側のカードを探す
cards.each do |card|
  if card[:face] == false
    puts card[:num]
  end
end
