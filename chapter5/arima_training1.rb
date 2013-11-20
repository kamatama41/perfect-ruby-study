fib = Fiber.new do |arg|
  loop do
    cnt = Fiber.yield '戻します'
    p "Fiber #{cnt}"
  end
end

cnt = 1
while line = STDIN.gets
  line = line.gsub(/\n/, '')
  if line == 'f'
    p fib.resume cnt
    cnt += 1
  else
    p 'f お願いします。'
  end
end

p 'end'