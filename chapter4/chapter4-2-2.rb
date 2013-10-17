# 4-2-2 メソッドをクラスのインスタンスメソッドとして取り込む
module Greetable
  def greet_to(name)
    puts "Hello, #{name}. My name is #{self.class}"
  end
end

class Alice
  include Greetable

  # moduleのメソッドをオーバーライドできる
  def greet_to(name)
    super
    puts 'Nice to meet you!'
  end
end

alice = Alice.new
alice.greet_to 'Bob'

# 代表的な組み込みモジュールEnumerable
class FriendList
  include Enumerable

  def initialize(*friends)
    @friends = friends
  end

  def each
    for v in @friends
      yield v
    end
  end
end

friend_list = FriendList.new('Alice', 'Bob', 'Charlie')

puts friend_list.count # 3
puts friend_list.map{|v| v.upcase}.inspect  # ["ALICE", "BOB", "CHARLIE"]
puts friend_list.find{|v| /b/ === v}  # 'Bob'
