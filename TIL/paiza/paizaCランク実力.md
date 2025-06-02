Cランク実力確認問題セット
https://paiza.jp/works/mondai/rank_test_problems_c_0001/problem_index?language_uid=ruby

電話番号 Ruby編
```
a = gets.chomp
b = gets.chomp
c = gets.chomp
puts a+"-"+b+"-"+c
```

気象観測 Ruby編
```
n = gets.to_i
if n < 2
    puts "clear"
elsif n < 9
    puts "sunny"
else
    puts "cloudy"
end
```

荷物検査 Ruby編
```
n, m = gets.split.map(&:to_i)
sum = 0
n.times do
    sum += gets.to_i
end

if sum <= m
    puts "OK"
else
    puts "NG"
end
```