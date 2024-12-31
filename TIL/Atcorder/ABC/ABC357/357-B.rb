#puts "a".ord : 97
#puts "z".ord : 122
#puts "A".ord : 65
#puts "Z".ord : 90

target = gets.chomp
line = target.split("")

b_num, s_num = 0, 0 # 大文字の数と小文字の数

line.each do |char|
  if char.ord >= 97 && char.ord <= 122
    s_num += 1
  elsif char.ord >= 65 && char.ord <= 90
    b_num += 1
  end
end

if b_num > s_num
  puts target.upcase
else
  puts target.downcase
end