puts '# 3-5-8 ブロック'
puts '# メソッドはブロック(処理？)を受け取ることができる。'
puts '# yieldをメソッドの中で呼び出すと、受け取ったブロックを実行する'
# TODO 勉強会で紹介する(高)
def block_sample
  puts 'stand up'
  yield
  puts 'sit down'
end

block_sample do
  puts 'walk'
end

puts '# ブロックを渡さないとLocalJumpErrorが発生'
begin
  block_sample
rescue => e
  puts "#{e.class}, #{e.message}"
end

puts '# ブロックを受け取った時だけ実行したい場合はblock_given?メソッドを使う'
def block_sample2
  puts 'stand up'
  yield if block_given?
  puts 'sit down'
end

block_sample2 do
  puts 'walk'
end
block_sample2

puts '# block_given?の標準APIでの使用例(Fileクラス)'
# ブロックを使わずにファイルの書き込み処理を行う
file = File.open('without_block.txt', 'w')
file.puts 'without block'
file.close

# ブロックを使った場合(ファイルは自動的にクローズされる)
File.open 'with_block.txt', 'w' do |file|
  file.puts 'with block'
end

puts '# ブロックは最後に評価された式を返り値として返すことができる'
def display_value
  puts yield
end

display_value do
  4423
end

puts '# ブロック内でnextを使うとブロックの呼び出し元に戻る'
display_value do
  next 42
end

puts '# ブロック内でbreakを使うとメソッドの呼び出し元に戻る'
display_value do
  break 44 # なにも表示されない
end

puts '# yieldに渡した引数はブロックで利用できる'
def with_current_time
  yield Time.now
end

with_current_time do |now|
  puts now.year
end

puts '# yieldに渡した引数はブロック内で指定した引数にあっていなくてもエラーにならない'
# ブロック引数なし
with_current_time do
  puts 'Hi!!'
end
# ブロック引数2つ
with_current_time do |now, something|
  puts something.inspect  # nil
end

puts '# yieldに渡した引数にもデフォルト引数や可変長引数を指定できる'
def default_argument_for_block
  yield
end

default_argument_for_block do |val = 'Hi'|
  puts val  # Hi
end

def flexible_arguments_for_block
  yield 1, 2, 3
end

flexible_arguments_for_block do |*params|
  puts params.inspect # [1, 2, 3]
end

puts '# 仮引数の先頭に&を付けることでメソッドにブロックを渡すことができる'
def block_sample3(&block)
  puts 'stand up'

  block.call if block

  puts 'sit down'
end

block_sample3 do
  puts 'walk'
end

puts '# Procオブジェクトにしたブロックはメソッドの引数として渡すことができる(&が必要)'
people = %w(Alice Bob Charlie)
block = Proc.new do |name|
  puts name
end

people.each &block

# こういう書き方もできる
block = Proc.new {|name| puts name}

people.each &block

puts '# &が無い場合はArgumentErrorが発生する'
begin
  people.each block
rescue => e
  puts "#{e.class}, #{e.message}"
end

puts '# Procオブジェクト以外にも&を付けて呼び出した結果がメソッドに渡すことができる'
p1 = Proc.new {|val| val.to_s}
p2 = :to_s.to_proc  # Symbolに対するto_procは Proc.new {|val| val.to_s} と同じ意味

class Person
  attr_accessor :name, :age
  def to_s
    "#{name}(#{age})"
  end
end

person = Person.new
person.name = 'kamatama'
person.age = 29

puts p1.call(person)  # kamatama(29)
puts p2.call(person)  # kamatama(29)

# 配列の要素を全部大文字にした新しい配列を作る
people = %w(Alice Bob Carol)

puts people.map{|person| person.upcase}
# Symbolに対するto_procを利用して同様の処理を行う
puts people.map(&:upcase)

puts '# 繰り返し以外に用いられるブロック'
# TODO 勉強会で紹介する(高)

puts '# (例)ファイルのオープン／クローズ、ロック／アンロックを隠ぺいしたメソッドを用意する'
def write_with_lock
  File.open 'time.txt', 'w' do |f|
    f.flock File::LOCK_EX

    yield f

    f.flock File::LOCK_UN
  end
end

write_with_lock do |f|
  f.puts Time.now
end

puts '# do...endと{...}では結合の優先順位が異なる'
def method1(arg1, arg2, &block)
  message = "#{arg1.to_s}, #{arg2.to_s}"
  message += ", #{block.call}" if block
  puts message
end

def method2(&block)
  if block
    block.call
  else
    'No-Block!!'
  end
end

# method2に{...}が渡される
method1 'Hello', method2 { 'Hola' }  # Hello, Hola

puts '# method1にblockを渡したい場合は括弧を付ける'
method1('Hello', method2) {'Hola'} # Hello, No-Block!!, Hola

puts '# もしくはdo...endブロックにする'
method1 'Hello', method2 do
  'Hola'
end

puts '# ブロックローカル変数'
%w(Alice Bob Charlie).each do |personName|
  someone = 'block local'
end

# NameErrorが発生
begin
  puts someone
rescue => e
  puts "#{e.class}, #{e.message}"
end

# NameErrorが発生
begin
  puts personName
rescue => e
  puts "#{e.class}, #{e.message}"
end

puts '# ブロック外にある変数はブロック内で参照できる'
people = []
%w(Alice Bob Charlie).each do |personName|
  people << personName
end

puts people.inspect #[Alice, Bob, Charlie]

puts '# ブロック外に同様のローカル変数があってもブロック引数は常にブロックローカル変数とみなされる(Ruby1.9からの仕様)'
someone = 'Dave'
people = []
# someoneはブロック内とブロック外で異なるオブジェクトを参照している
%w(Alice Bob Charlie).each do |someone|
  people << someone
end

puts people.inspect # [Alice, Bob, Charlie]
puts someone # Dave

puts '# ブロック引数以外にもブロックローカル変数を利用したい場合は、ブロックの仮引数リストの後ろにセミコロンを置き、その後ろに変数名を記述する'
someone = 'Dave'
%w(Alice Bob Charlie).each do |personName; someone|
  someone = personName
  puts someone
end

puts someone # Dave

puts '# 3-5-9 擬似キーワード引数'
puts '# キーワード引数が無いruby1.9以前のキーワード引数的な使い方の例'
# TODO 勉強会で紹介する(中)
def keywords(hash = {})
  hash
end

# ブレース{}を省略できる
puts keywords(alice:'ALICE', bob:'BOB') # {:alice=>"ALICE", :bob=>"BOB"}

# メソッド呼び出しの括弧も省略できる
puts keywords alice:'ALICE', bob:'BOB' # {:alice=>"ALICE", :bob=>"BOB"}

puts '# 3-5-10 キーワード引数'
puts '# Ruby2.0からこういう書き方ができる'
# TODO 勉強会で紹介する(中)
def keywords2(alice: nil, bob:nil)
  {alice: alice, bob: bob}
end

puts keywords2 alice:'ALICE', bob:'BOB'

puts '# キーワード引数に存在しないキーワードを指定するとArgumentErrorになる'
begin
  keywords2 charlie:'CHARLIE'
rescue => e
  puts "#{e.class}, #{e.message}"
end

puts '# キーワード引数にデフォルト引数を指定する'
def keywords3(alice:'Alice', bob:'Bob')
  {alice: alice, bob: bob}
end

puts keywords3 bob:'BOB' # {:alice=>"Alice", :bob=>"BOB"}

puts '# 指定した以外のキーワード引数を利用したい場合は頭に**を付けた仮引数を用いることができる'
def keywords_with_options(alice:nil, bob:nil, **others)
  {alice:alice, bob:bob, others:others}
end

puts keywords_with_options alice:'ALICE', bob:'BOB', charlie:'CHARLIE' # {:alice=>"ALICE", :bob=>"BOB", :others=>{:charlie=>"CHARLIE"}}

puts '# 引数の順番を変えることもできる'
puts keywords_with_options charlie:'CHARLIE', alice:'ALICE', bob:'BOB' # {:alice=>"ALICE", :bob=>"BOB", :others=>{:charlie=>"CHARLIE"}}

puts '# **付いた仮引数のデフォルト値は空のhash'
puts keywords_with_options alice:'ALICE', bob:'BOB' # {:alice=>"ALICE", :bob=>"BOB", :others=>{}}

puts '# 3-5-11 仮引数の順序'
puts <<EOS
1. 通常の引数／省略可能な引数
2. *で指定できる可変長の引数
3. キーワード引数
4. **で指定できるハッシュの引数
5. &で指定できるブロックの引数
EOS

puts '# 3-5-12 ::を使ったメソッド呼び出し'
puts '# メソッドは.だけでなく::を使っても呼び出せる'
# TODO 勉強会で紹介する(低)
puts Time::now

puts '# 3-5-13 メソッド定義の取り消し'
puts '# undefを使って定義したメソッドを取り消すことができる'
# TODO 勉強会で紹介する(低)
def undef_greet
  puts 'hola'
end

undef_greet

undef undef_greet

begin
  undef_greet
rescue => e
  # NameErrorが発生する
  puts "#{e.class}, #{e.message}"
end

puts '# 3-5-14 メソッドに別名を付ける'
puts '# aliasを用いて既存のメソッドに別名を付けることができる'
# TODO 勉強会で紹介する(中)
# greetをgreetingという名前で呼び出せるようにする
def greet
  puts 'hi'
end

alias greeting greet
greeting  # hi
