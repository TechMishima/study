# num = 10

# while num <= 1000
#   if  num.to_s == num.to_s.reverse &&
#       num.to_s(2) == num.to_s(2).reverse &&
#       num.to_s(8) == num.to_s(8).reverse
#         puts num
#         break
#   end
# num += 1
# end



# 11から捜索開始
num = 11
while true
  if  num.to_s == num.to_s.reverse &&
    num.to_s(8) == num.to_s(8).reverse &&
    num.to_s(2) == num.to_s(2).reverse
    puts num
    break
  end
  # 奇数だけ探す為、2つずつ増やす
  num += 2
end