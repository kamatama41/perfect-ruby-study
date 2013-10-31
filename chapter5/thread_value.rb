t = Thread.fork('Masudak', 'destroyer') do |name, job|
  sleep 1
  "#{name} is #{job}!"
end

p t.status # => "run" (実行中)
p t.value  # => スレッドの終了を待ち、実行結果を出力する
p t.status # => false (正常終了)