t = Thread.fork do
  raise # RuntimeError
end

begin

  t.join     # RuntimeError が発生
rescue => e
  puts e.class
  puts e.backtrace
end