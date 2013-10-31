t = Thread.fork('Masudak', 'destroyer') do |name, job|
  sleep 1
  "#{name} is #{job}!"
end

p t.status # => "run" (実行中)
p t.join   # => #<Thread:0x007fe63404e8a0 dead> みたいな感じでスレッドIDを出力する
p t.status # => false (正常終了)