p [true, true, true].all?
p [true, false, true].all?

res = [4, 4, 2, 3].all? do |v|
  v.is_a? Integer
end
p res

res = [4, "hoge", 5, 6].all? do |v|
  v.is_a? Integer
end
p res

# grepは引数の要素と「===」で比較し一致した内容を返す
res = %w(Alice Bob Charlie).grep(/a/i)
p res

# 要素にクラスを入れることも出来る
res = ['a', 'x', 3, 9].grep(String)
p res

# ブロックを使ってマッチする最初の要素を返す detect
res = [4, 4, 3, 2].detect do |v|
  v.even?
end
p res

# ブロックを使ってマッチする要素全てを返す select & マッチしない要素を返す reject
res = [4, 4, 3, 2].select do |v|
  v.even?
end
p res

res = [4, 4, 3, 2].reject do |v|
  v.even?
end
p res

# 畳み込み演算 inject
# 与えられたブロックの演算を行って要素をまとめる。
res = [4, 4, 2, 3].inject(0) do |result, num|
  result + num
end
p res

res = [4, 4, 2, 3].inject(:+)
p res

# ブロックの戻り値をキーとしたハッシュを生成 group_by
res = [1, 2.0, 3.0, 4].group_by do |val|
  val.class
end
p res

# ブロックの戻り値の真偽で2グループに分ける partition
res = [1, 2, 3, 4, 5].partition do |n|
  n.even?
end
p res