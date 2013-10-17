puts '# 3-2-1 条件分岐'
puts '# if-elsif-elseの使用例'
5.times { |n|
  if n.zero?
    puts '0でした'
  elsif n.even?
    puts '偶数でした'
  elsif n.odd?
    puts '奇数でした'
  else
    puts '分かりません！'
  end
}

puts '# unless-elseの使用例'
5.times { |n|
  unless n.zero?
    puts '0ではありませんでした'
  else
    puts '0でした'
  end

}

puts '# if文では値を返せる'
platform =
    if /darwin/ =~ RUBY_PLATFORM
      'Mac'
    else
      'Others'
    end
puts platform

puts '# if文をthenを付ければ1行でかける'
5.times { |n|
  if n.zero? then puts '0でした' else puts '0ではありませんでした' end
}

puts '# 3項演算子はあまり使わない？'
5.times { |n|
  puts n.zero? ? '0でした' : '0ではありませんでした'
}

puts '# else句が無い場合は後置if,後置unlessを使う'
5.times { |n|
  puts '0でした' if n.zero?
  puts '0ではありませんでした' unless n.zero?
}

puts '# 比較対象が1つだけならcase文の方が可読性が高い'
stone = 'ruby'

case stone
  when 'ruby'
    puts '7月'
  when 'peridot', 'sardonyx'
    puts '8月'
  else
    puts 'よくわかりません'
end

puts '# case文で正規表現を使ったパターン'
stone = 'sardonyx'
case stone
  when /ruby/
    puts '7月'
  when /peridot|sardonyx/
    puts '8月'
  else
    puts 'よくわかりません'
end

puts '# case文は最後に評価した値を返す'
detected =
    case stone
      when /ruby/
        '7月'
      when /peridot|sardonyx/
        '8月'
      else
        'よくわかりません'
    end
puts detected

puts '# whenもthenを使うことで1行でかける'
case stone
  when /ruby/ then puts '7月'
  when /peridot|sardonyx/ then puts '8月'
  else
    puts 'よくわかりません'
end

puts '# caseに値を渡さない場合'
case
  when stone =~ /ruby/
    puts '7月'
  when stone =~ /peridot|sardonyx/
    puts '8月'
  else
    puts 'よくわかりません'
end

puts '# case文はwhenの値をレシーバーとして「===」メソッドで比較している'
class MyString
  def initialize(val)
    @val = val
  end

  def ===(other)
    @val.upcase == other.upcase
  end
end

a = MyString.new('A')
b = MyString.new('B')
c = MyString.new('C')
case 'a'
  when a
    puts 'Aでした'
  when b
    puts 'Bでした'
  when c
    puts 'Cでした'
  else
    puts 'どれでもありませんでした'
end

puts '# 3-2-2 繰り返し'
puts '# whileを使って配列の要素を先頭から順に出力'
languages = %w(Perl Python Ruby)
i = 0

while i < languages.length
  puts "Hello, #{languages[i]}"
  i += 1
end

puts '# untilの使用例'
languages = %w(Prel Python Ruby)
i = languages.length - 1

until i < 0
  puts "Hello, #{languages[i]}"
  i -= 1
end

puts '# 後置while, 後置untilの使用例'
begin
  processing = rand(2) == 1
  puts "processing=#{processing}"
end while processing
puts 'while end.'
begin
  processing = rand(2) == 1
  puts "processing=#{processing}"
end until processing
puts 'until end.'

puts '# eachメソッドを持つオブジェクトはforループを利用できる'
for name in %w(Alice Bob Carol)
  puts name
end
puts '# forループの中で定義した変数をループ外で参照可能'
# TODO 勉強会で紹介する(低)
puts name # Carol

puts '# hashをforループさせる場合は、要素としてキーと値が配列になった要素が取得できる'
for val in {a:1, b:2}
  puts "key=#{val[0]},value=#{val[1]}"
end
puts '# それぞれ別の変数として使いたい場合は、多重代入の要領で変数をカンマで区切る'
for key, val in {a:1, b:2}
  puts "key=#{key},value=#{val}"
end

puts '# 単純な無限ループはKernel.#loopを使う'
loop do
  puts 'infinity loop!'
  break if rand(2) == 1 # 無限ループになるのをさける
end

puts '# 単純な繰り返しを行いたい場合はInteger.#timesを使う'
2.times do
  puts 'こんにちは！'
end

puts '# 3-2-3 ジャンプ構文'
puts '# ループの中でbreakを呼び出すとループを中断できる'
languages = %w(Prel Python Ruby Smalltalk JavaScript)

languages.each do |language|
  puts language
  if language == 'Ruby'
    puts 'I found Ruby!!'
    break
  end
end

puts '# breakに渡した値が返り値になる'
languages = %w(Prel Python Ruby Smalltalk JavaScript)

result =
  languages.each do |language|
    puts language
    if language == 'Ruby'
      break 'I found Ruby!!'
    end
  end
puts result

puts '# ループの中でnextを呼ぶと次の繰り返しに移る'
# TODO 勉強会で紹介する(高)
languages = %w(Prel Python Ruby Smalltalk JavaScript)

languages.each do |language|
  puts language
  next unless language == 'Ruby'
  puts 'I found Ruby!!!'
end

puts '# ループの中でredoを呼ぶともう一度その処理をやり直す'
# TODO 勉強会で紹介する(高)
languages = %w(Prel Python Ruby Smalltalk JavaScript)

languages.each do |language|
  puts language
  if language == 'Ruby'
    puts 'I found Ruby!!!'
    redo if rand(2) == 1  # 無限ループになるのをさける
  end
end