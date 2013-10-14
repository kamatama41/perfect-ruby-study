puts '# 3-1-1'
a, b, c = true, true, false

puts a or b && c
puts (a or b) && c

puts '# 3-1-2'
puts 1.+(1)
puts 1 + 1

class MyObject
  def ==(other)
    # 同じクラスのオブジェクトであれば必ず真を返す
    self.class == other.class
  end
end

puts MyObject.new == MyObject.new
puts '# 普通のObjectではfalseになる'
puts Object.new == Object.new

puts 'pre' + 'view'

puts 2 * 2
puts 'A' * 3

puts '# 3-1-3'
a = 'Alice'
b = 'Alice'

puts a == b
puts a.equal?(b)

puts '# 3-2-1'
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
