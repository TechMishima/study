num = 1000
op = [" * ", ""]

while num <= 9999
  line = num.to_s.chars.map(&:to_i)
  op.each do |x|
    op.each do |y|
      op.each do |z|
        string = "#{line[0]}#{x}#{line[1]}#{y}#{line[2]}#{z}#{line[3]}"
        if line[0] != 0 || line[1] != 0 || line[2] != 0 || line[3] != 0
          integer = eval(string)
        end
          if num == integer
            puts integer
            break
          end
      end
    end
  end
  num += 1

end