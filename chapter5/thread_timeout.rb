t = Thread.fork('Masudak', 'destroyer') do |name, job|
  sleep 2
  "#{name} is #{job}"
end

p t.status  # => "run" (実行中)
p t.join(1) # => nil （タイムアウト時間内に処理が終わらない）
p t.alive?  # => true (スレッドそのものは稼働中)
p t.status  # => "sleep" (sleepにより停止中)
p t.value   # => "Masudak is destroyer!"
p t.status  # => false