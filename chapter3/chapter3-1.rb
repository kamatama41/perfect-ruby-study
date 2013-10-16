puts '# 3-1-1'
a, b, c = true, true, false

puts a or b && c
puts (a or b) && c

puts '# 3-1-2'
puts 1.+(1)
puts 1 + 1

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