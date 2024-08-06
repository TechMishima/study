# add_numbers.rb
puts "Enter the first number:"
number1 = gets.chomp

puts "Enter the second number:"
number2 = gets.chomp

# Pythonスクリプトを呼び出す
result = `python3 add_numbers.py #{number1} #{number2}`

# 結果を表示
puts "The sum is: #{result}"