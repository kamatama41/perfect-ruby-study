def countup
  File.open 'counter.txt', File::RDWR | File::CREAT do |f|
    last_count = f.read.to_i

    f.rewind
    f.write last_count + 1
  end
end


File.delete 'counter.txt'           # 初期化処理

# ロックをかけないパターン
10.times {
  Thread.fork do
    countup
  end
}
sleep 1
puts File.read('counter.txt').to_i  # 結果を読み込む

File.delete 'counter.txt'           # 初期化処理

# synchronize でlockを取得するパターン
mutex = Mutex.new

10.times.map {
  Thread.fork {
    mutex.synchronize { countup }
  }
}.map(&:join)

puts File.read('counter.txt').to_i  # 結果を読み込む

# lockを明示的に取得するパターン

File.delete 'counter.txt'           # 初期化処理

mutex = Mutex.new

10.times.map {
  Thread.fork {
    begin
      mutex.lock
      countup
    ensure
      mutex.unlock; # このパターンの場合は最後にlockの開放処理が必要
    end
  }
}.map(&:join)

puts File.read('counter.txt').to_i  # 結果を読み込む