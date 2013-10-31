t = Thread.fork('Masudak', 'destroyer') do |name, job|
  "#{name} is #{job}!"
end

p t.value