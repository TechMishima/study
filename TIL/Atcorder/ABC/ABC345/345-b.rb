require 'bigdecimal'
require 'bigdecimal/util'

num = BigDecimal(gets.to_i)
hoge = num / 10
puts hoge.ceil