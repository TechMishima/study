line = gets.chomp.split("")

val1 = line[0]
val2 = line[1]
val3 = line[2]
if val1 == val2
  line.each.with_index do |val, i|
    if val != val1
      puts i + 1
      break
    end
  end
elsif val1 == val3
  puts 2
else
  puts 1
end