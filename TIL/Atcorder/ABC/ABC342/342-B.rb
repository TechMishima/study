N = gets.to_i
menbers = gets.split.map(&:to_i)
Q = gets.to_i
Q.times do
  line = gets.split.map(&:to_i)
  #stop = false
  menbers.each do |menber|
    if menber == line[0] || menber == line[1]
      puts menber
      break
    end
  end
end