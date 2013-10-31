m1, m2 = Mutex.new, Mutex.new

t1 = Thread.fork {
  m1.synchronize do
    sleep 1
    m2.synchronize do
      p 'never called'
    end
  end
}

t2 = Thread.fork {
  m2.synchronize do
    sleep 1
    m1.synchronize do
      p 'never called'
    end
  end
}

t1.join # Deadlockを検知します
t2.join