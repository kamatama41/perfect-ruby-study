puts '# 3-5-1 メソッド呼び出しと括弧'
puts '# メソッド呼び出しの括弧は省略可能'
puts 'hello'
puts('hello')

puts '# 戻り値を得るための式として記述する場合は括弧を付けて、手続きを実行する場合は括弧を省略する'
# TODO 勉強会で紹介する(中)
def find_member_by_name(name)
  {id:1, name:name}
end

def set_current(member)
end

member = find_member_by_name('kamatama41')
puts "#{member[:id]}, #{member[:name]}"
set_current member

puts '# 3-5-2 メソッド呼び出しとローカル変数'
puts '# レシーバと括弧、引数のないメソッドと変数は変数が優先される'
# TODO 勉強会で紹介する(低)
sweet = 'honey'
def sweet
  'salt'
end
# ローカル変数へのアクセスとなる
puts sweet  # honey
# メソッドを呼び出すには明示的に括弧を付ける
puts sweet()  # salt

puts '# 3-5-3 メソッドと定数'
puts '# 大文字で始まるメソッドをレシーバ・引数なしで呼び出そうとするとエラーになる'
def Hello
  puts 'Hello, My method!!'
end

begin
  Hello
rescue => e
  puts "#{e.class}, #{e.message}"
end

puts '# 3-5-4 戻り値'
puts '# メソッドの中で最後に評価された式が戻り値となる'
def call
  'called'
end
puts call

puts '# 3-5-5 省略可能な仮引数'
puts '# メソッドの引数には任意の式を与えることができる'
# TODO 勉強会で紹介する(高)
def greet(name, message = 'Hi')
  puts "#{message}, #{name}"
end

greet 'kamatama'
greet 'kamatama', 'Hello!!!'

puts '# 複数のデフォルト引数を指定可能。ただし途中の引数を省略することができない'
# TODO 勉強会で紹介する(中)
def greet2(name, message = 'Hi', suffix = '.')
  puts "#{message}, #{name}#{suffix}"
end

greet2 'kamatama'
greet2 'kamatama', 'Hello!!!'
greet2 'kamatama', 'Hello!!!', ':)'

puts '# 省略可能な引数の後に省略不可の引数を入れるべきではない'
# TODO 勉強会で紹介する(低)
def greet3(name, message = 'Hi', suffix)
  puts "#{message}, #{name}#{suffix}"
end

greet3 'kamatama', ':)'
greet3 'kamatama', 'Hello!!!', ':)'

puts '# 3-5-6 可変長引数'
puts '# 引数の先頭に*を付けることで、任意の数の引数を配列として受け取ることができる'
# TODO 勉強会で紹介する(中)
def greet_messages(name, *messages)
  messages.each do |message|
    puts "#{message}, #{name}"
  end
end

greet_messages 'kamatama', 'Hi!!', 'Hello!!'

puts '# 引数を無視したい場合、引数に*を付けることができる'
# TODO 勉強会で紹介する(低)
def greet5(name, *)
  puts "Hello, #{name}"
end

greet5 'kamatama', 'Ya!!', 'Hi!!'

puts '# 3-5-7 配列の展開'
puts '# 実引数の頭に*を付けると配列を複数の引数として渡すことができる'
# TODO 勉強会で紹介する(中)
def greet_twice(name, first_message, second_message)
  puts "#{first_message}, #{name}"
  puts "#{second_message}, #{name}"
end

greetings = %w(Hello Hola)
greet_twice 'kamatama', *greetings
puts '# 引数に指定しない数を渡すとArgumentErrorになる'
begin
  greetings = %w(Hello Hola Hey)
  greet_twice 'kamatama', *greetings
rescue => e
  puts "#{e.class}, #{e.message}"
end