# study/TIL/Atcorder/ABC/ABC345

s = gets.chomp.split("")
if s.slice(0) == "<" && s.slice(s.length - 1)
  t1, t2 = s.shift, s.pop
  s = s.uniq
  if s.length == 1 && s[0] == "="
    puts "Yes"
  else
    puts "No"
  end
else
  puts "No"
end