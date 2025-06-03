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

背の順 Ruby編
```
n = gets.to_i
menbers = []

n.times do
    a, b = gets.chomp.split
    menbers << [a.to_i, b]
end

ans_menbers = menbers.sort{|a,b| b[0] <=> a[0]}

ans_menbers.each do |ans|
    if ans[0] != 168
        puts ans[1]
    else
        if ans[1] == "Sato"
            puts "Suzuki"
        else
            puts "Sato"
        end
    end
end
```