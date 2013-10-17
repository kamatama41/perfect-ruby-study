# 4-2-4 モジュール関数
# モジュールから直接呼び出す
puts Math.sqrt(2) # 1.4142135623730951

# includeして使う
include Math
puts sqrt(2)

module MyFunctions
  def my_module_function
    puts 'Called!'
  end
  module_function :my_module_function
end

MyFunctions.my_module_function