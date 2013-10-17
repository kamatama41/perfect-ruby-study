puts '# 3-3-1 例外の発生と例外クラス'
puts '# Kernel.#raiseを使うとRuntimeErrorを発生させられる'
puts '# 例外を細くするためにはbegin-rescue節で処理を囲む'
# TODO 勉強会で紹介する
begin
  raise 'error!'
rescue => e
  puts e.class # RuntimeError
  puts e.message
  puts e.backtrace
end

puts '# Kernel.#raiseの第一引数でクラスを指定できる'
# TODO 勉強会で紹介する
begin
  raise StandardError, 'error!'
rescue => e
  puts e.class # StandardError
  puts e.message
  puts e.backtrace
end

puts '# rescueはデフォルトだとStandardExceptionの派生クラスをcatchするが、指定すれば他の例外もキャッチできる'
# TODO 勉強会で紹介する
begin
  raise ScriptError, 'error!'
rescue Exception => e
  puts e.class
  puts e.message
  puts e.backtrace
end

puts '# 例外ごとに別の例外処理を行いたい場合'
5.times do |n|
  begin
      if n.even?
        raise LoadError
      else
        raise ArgumentError
      end
  rescue LoadError => e
    puts 'rescue LoadError'
  rescue ArgumentError => e
    puts 'rescue ArgumentError'
  end
end

puts '# 一つのrescue節に複数の例外を指定できる'
# TODO 勉強会で紹介する
5.times do |n|
  begin
      if n%3 == 0
        raise LoadError
      elsif n%3 == 1
        raise NameError
      else
        raise ArgumentError
      end
  rescue LoadError => e
    puts 'rescue LoadError'
  rescue ArgumentError, NameError => e
    puts "rescue #{e.class}"
  end
end

puts '# rescue節の中でraiseを呼ぶと、同じ例外を再度発生させられる'
# TODO 勉強会で紹介する
begin
  raise StandardError, 'error!!!'
rescue => e
  begin
    raise
  rescue => e
    puts e.class
    puts e.message
    puts e.backtrace
  end
end

puts '# 後置rescueの例.後置rescueは例外を指定することはできない'
# TODO 勉強会で紹介する
result = (1 / 0 rescue false)
puts result # false

puts '# 例外発生に関わらず必ず実行したい処理はensure節に書く'
# TODO 勉強会で紹介する
begin
  file = File.open('test.txt')
  file.each_line do |l|
    puts l
  end
rescue => e
    puts e.class
    puts e.message
    puts e.backtrace
ensure
  file.close if file
end

puts '# 例外発生しなかった時だけ実行する処理はelse節に書く'
# TODO 勉強会で紹介する
begin
  file = File.open('test.txt')
  file.each_line do |l|
    puts l
  end
rescue => e
    puts e.class
    puts e.message
    puts e.backtrace
else
  puts 'ファイルが開けました!!'
ensure
  file.close if file
end

puts '# 3-3-3 例外処理の戻り値'
puts '# begin,rescue,else節で評価された式が戻り値になる'
# TODO 勉強会で紹介する
result =
    begin
      value = 'return value'
      raise
    rescue
      value
    ensure
      'this is not return value' # 実行されるが戻り値とはならない
    end
puts result

puts '# 3-3-4 メソッドやクラス／モジュール定義で例外を補足する'
puts '# メソッド定義式に記述した例外処理はメソッド呼び出し時に発生した例外を制御できる'
# TODO 勉強会で紹介する
def meth(n)
  puts n
  if n.even?
    raise 'error!!'
  end
rescue => e
  puts e.message
else
  puts 'else'
ensure
  puts 'ensure'
end

5.times do |n|
  meth n
end

puts '# 3-3-5 例外が発生した場合にリトライする'
puts '# rescue句の中でretryを呼び出すとbegin節の処理をやり直す'
begin
  failed ||= 0
  puts 'trying...'

  raise
rescue
  failed += 1
  retry if failed < 5
end
