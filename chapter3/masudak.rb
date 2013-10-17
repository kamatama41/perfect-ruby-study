require "open3"
require "systemu"

commands = ['uptime', 'ls /hogehogehogehoge', 'df']

def exec_commands(commands)
  commands.each do |command|
    yield command
    puts ''
  end
end

puts '---------- system ---------'
exec_commands commands do |command|
  system command
end

puts '---------- Open3 ---------'
exec_commands commands do |command|
  o, e, s = Open3.capture3(command)
  puts "o=#{o}"
  puts "e=#{e}"
  puts "s=#{s}"
end

puts '---------- Systemu ---------'
exec_commands commands do |command|
  status, stdout, stderr = systemu(command)
  puts "status=#{status}"
  puts "stdout=#{stdout}"
  puts "stderr=#{stderr}"
end

puts '---------- spawn ---------'
exec_commands commands do |command|
  spawn(command)
end