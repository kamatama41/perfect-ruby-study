t = Thread.fork {sleep 1}

p '--- sleep ---'

p t.status  # => "sleep" (停止中)
p t.alive?  # => true : statusが "run" または "sleep" または "aborting" であればtrueを返す
p t.stop?   # => true : statusが "sleep" または false または nil であればtrueを返す

t.join

p '--- finished ---'

p t.status  # => false (正常終了)
p t.alive?  # => false : statusが "run" または "sleep" または "aborting" であればtrueを返す
p t.stop?   # => true : statusが "sleep" または false または nil であればtrueを返す