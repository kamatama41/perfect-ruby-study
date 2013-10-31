t = Thread.fork {
  Thread.stop

  p 'hi'
}

sleep 1     # 確実に子スレッドがスリープするまで待つ

p t.status  # => "sleep"

sleep 3
p 'run thread'

t.run.join