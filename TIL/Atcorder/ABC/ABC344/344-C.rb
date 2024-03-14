n = gets.to_i
lineN = gets.split.map(&:to_i)
m = gets.to_i
lineM = gets.split.map(&:to_i)
l = gets.to_i
lineL = gets.split.map(&:to_i)
q = gets.to_i
lineQ = gets.split.map(&:to_i)

lineQ.each do |target|
stop = false
  lineN.each do |valN|
    lineM.each do |valM|
      lineL.each do |valL|
        if target == valN + valM + valL
          puts "Yes"
          stop = true
        else
          break if target < valN + valM + valL
        end
      end
    break if stop == true
    end
  break if stop == true
  end
puts "No" if stop == false
end