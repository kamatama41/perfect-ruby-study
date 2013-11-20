def less(file_name, count)

  p '前処理します。'

  File.open file_name, 'w' do |f|
    10.times do |n|
      f.puts "Line #{n+1}"
    end
  end

  lessFiber = Fiber.new do |arg|
    read_count = 0
    mod = count+1
    p 'ファイル開きます。'
    File.open(file_name).each do |line|
      read_count+=1
      if read_count % mod != 0
        p line.chomp
      else
        Fiber.yield true
      end
    end
    # 終わったらfalseを返す
    Fiber.yield false
  end

  while line = STDIN.gets.chomp
    if line == 'f'
      break unless lessFiber.resume ''
    else
      p 'f でお願いします。'
    end
  end
ensure
  p '後処理します。'
  File.delete file_name
end

less 'test.txt', 3