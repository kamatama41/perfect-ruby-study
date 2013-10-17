puts '# 3-1-1 演算子と優先順位'
a, b, c = true, true, false

puts a or b && c
puts (a or b) && c

puts '# 3-1-2 メソッドとして定義されている演算子'
# TODO 勉強会で紹介する
puts 1.+(1)
puts 1 + 1

puts '# 演算子オーバーロードの例'
class MyNumber
  def initialize(val)
    @val = val
  end

  def +(other)
    @val - other
  end
end

val = MyNumber.new(3)
puts val + 3  # 0

class MyObject
  def ==(other)
    # 同じクラスのオブジェクトであれば必ず真を返す
    self.class == other.class
  end
end

puts MyObject.new == MyObject.new
puts '# 普通のObjectではfalseになる'
puts Object.new == Object.new

puts 'pre' + 'view'

puts 2 * 2
puts 'A' * 3

puts '# 3-1-3'
a = 'Alice'
b = 'Alice'

puts a == b
puts a.equal?(b)