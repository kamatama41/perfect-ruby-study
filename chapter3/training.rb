# 課題1
class Mod
  attr_reader :val

  def initialize(val)
    @val = val
  end
  def ===(other)
    other%@val == 0
  end

  def *(other)
    Mod.new(other.val*@val)
  end
end

mod5 = Mod.new(5)
mod3 = Mod.new(3)

100.times do |n|
  case n
    when mod3 * mod5
      puts 'FizzBuzz'
    when mod3
      puts 'Fizz'
    when mod5
      puts 'Buzz'
    else
      puts n
  end
end


# 課題2
def time(&block)
  start_time = Time.now

  begin
    block.call
  ensure
    end_time = Time.now
    puts "#{end_time - start_time} sec"
  end
end

time do
  puts 'Sleep....'
  sleep 1.5
end
