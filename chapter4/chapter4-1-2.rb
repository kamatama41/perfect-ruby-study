# 4-1-2 インスタンスメソッド
puts 2.even? # true

str = 'abc'

# 破壊的でないメソッド
puts str.reverse  # cba
puts str          # abc

# 破壊的なメソッド
puts str.reverse! # cba
puts str          # cba