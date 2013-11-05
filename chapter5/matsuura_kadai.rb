# fizz?, buzz? メソッドを拡張
class Fixnum
  def initialize
  end
  def fizz?
    self % 3 == 0
  end
  def buzz?
    self % 5 == 0
  end
end

# fizz?, buzz? メソッドのテスト
(1..15).each do |v|
  p "#{v}: #{[v.fizz?, v.buzz?]}"
end

# Arrayクラスに、Enumerateモジュールのメソッドを使って
# 3の倍数だけを抜き出した配列を作るメソッドを作るべし。
class Fixnum
  def ===(other)
    other % self == 0
  end
end

class Array
  def grep_by_fizz
    self.grep(3)
  end
end
p [1, 2, 3, 4, 5, 6].grep_by_fizz

# Arrayクラスに、Enumerateモジュールのメソッドを使って
# 要素が1つでも3の倍数ならtrue、そうでなければfalseを返すメソッドを作るべし。
class Array
  def any_of_fizz?
    self.any? do |v|
      v.fizz?
    end
  end
end
# テスト
p [1, 2].any_of_fizz? # false
p [1, 2, 3].any_of_fizz? # true
p [1, 2, 4].any_of_fizz? # false
p [1, 2, 6].any_of_fizz? # true