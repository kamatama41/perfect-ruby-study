# 4-2-3 メソッドをオブジェクトに取り込む
module Destroyer
  def introduce
    super
    puts 'I\'m destroyer.'
  end
end

module Programmer
  def introduce
    super
    puts 'I\'m programmer.'
  end
end

class Person
  def initialize(name)
    @name = name
  end

  def introduce
    puts "My name is #{@name}"
  end
end

maruyama = Person.new('maruyama')
masudaK = Person.new('masudaK')

maruyama.extend Programmer
maruyama.introduce

masudaK.extend Destroyer
masudaK.introduce