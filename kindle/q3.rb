=begin
rescue => exception
  
end
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

=end



=begin ～～～～～解説～～～～～
# カードの初期化
N = 100
cards = Array.new(N, false)

# 2~Nまで裏返す
(2..N).each{|i|
  j = i - 1
  while (j < cards.size) do
    cards[j] = !cards[j]
    j += i
  end
}

# 裏向きのカードを出力
N.times{|i|
  puts i + 1 if !cards[i]
}
=end


cards = []
100.times do |i|
  card = {num: i + 1, switch: "ura"}
  cards << card
end

n = 2
m = 0
while (n <= 100) do
  m = n
  while (m <= 100) do
    if cards[m - 1][:switch] == "ura"
      cards[m - 1][:switch] = "omote"
    elsif cards[m - 1][:switch] == "omote"
      cards[m - 1][:switch] = "ura"
    end
    m += n
  end
n += 1
end

cards.each do |card|
  puts card[:num] if card[:switch] == "ura"
end