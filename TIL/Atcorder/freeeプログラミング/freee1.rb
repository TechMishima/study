puts "料理数N, ドリンクの定価P, 割引後のドリンク料金Q を入力して下さい。"
N, P, Q = gets.split.map(&:to_i)
puts "料理の価格Dを設定して下さい。(Nの数だけ設定)"
foods = gets.split.map(&:to_i)

targets = foods.map {|food| food + Q}
targets << P
puts targets.min