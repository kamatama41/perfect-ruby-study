# 4-1-8 特異メソッド
# TODO 勉強会で紹介する
class Foo
  def override_me
    puts 'in Foo class'
  end
end

foo = Foo.new
bar = Foo.new

# barだけにメソッドを追加する
def bar.singleton_method
  puts 'Called!!'
end

bar.singleton_method

puts '# barだけにメソッドを追加する'
begin
  foo.singleton_method
rescue => e
  puts "#{e.class}, #{e.message}"
end

puts '# 特異メソッド無いではsuperで元のクラスのメソッドを呼び出すことができる'
def foo.override_me
  super
  puts 'in singleton method'
end

foo.override_me