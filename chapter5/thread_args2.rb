for number in (1..10)
  Thread.fork number do |number|
    sleep 1
    p number
  end
end

(Thread.list - [Thread.current]).each &:join  # main threadは除く子スレッドの終了を待つ