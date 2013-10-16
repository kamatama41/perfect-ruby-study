puts '# 3-4-1 任意の処理からの脱出'
puts '# catch,throwを使ってネストした繰り返し処理からの脱出'
# TODO 勉強会で紹介
catch :triple_loop do
  loop do
    puts 'one'

    loop do
      puts 'twp'

      loop do
        puts 'three'

        throw :triple_loop
      end
    end
  end
end

puts '# catchをネストするパターン'
catch :entire do
  catch :process do
    throw :entire # :entireのブロックを中断する
  end
end

puts '# 3-4-2 戻り値'
puts '# throwの第二引数にはcatchの戻り値を渡すことができる'
result = catch(:foo) {
  throw :foo, 'returned value!'
}
puts result
