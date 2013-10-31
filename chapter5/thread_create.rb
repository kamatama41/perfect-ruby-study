class SimpleThread < Thread
  def initialize
    #super
    p 'Initialize simple thread!'
  end
end

SimpleThread.new { p :new }.join # Thread.new は initializeを実行する

p '--------'

SimpleThread.start { p :start }.join # Thread.start は initializeを実行しない

p '--------'

SimpleThread.fork { p :fork }.join # Thread.fork は initializeを実行しない