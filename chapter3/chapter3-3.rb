puts '# 3-3-1 例外の発生と例外クラス'
puts '# Kernel.#raiseを使うとRuntimeErrorを発生させられる'
puts '# 例外を細くするためにはbegin-rescue節で処理を囲む'
begin
  raise 'error!'
rescue => e
  puts e.class
  puts e.message
  puts e.backtrace
end

puts '# Kernel.#raiseの第一引数でクラスを指定できる'
begin
  raise StandardError, 'error!'
rescue => e
  puts e.class
  puts e.message
  puts e.backtrace
end

puts '# rescueはデフォルトだとStandardExceptionの派生クラスをcatchするが、指定すれば他の例外もキャッチできる'
begin
  raise ScriptError, 'error!'
rescue Exception => e
  puts e.class
  puts e.message
  puts e.backtrace
end