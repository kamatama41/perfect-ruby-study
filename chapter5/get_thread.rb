#p Thread.main  # メインの実行スレッド
#p Thread.current # 現在実行中のスレッドはメインスレッドでもある
#
#p '------'
#
#t = Thread.fork do
#  sleep 1
#  [Thread.main, Thread.current] # ブロック内の処理を実行しているスレッドはThread.current
#end
#
#p Thread.list # 現在稼働中のスレッド一覧
#
#p '------'
#
#p t.value # メインスレッド、forkしたスレッド（終了）

p Thread.main
p Thread.current

t = Thread.fork do
  sleep 1
  [Thread.main, Thread.current]
end

p Thread.list

p t.value