# 4-1-10 クラス定義のネスト
# JavaでいうInnerClassのような感じでクラス定義内に書く
class My
  class SweetClass
  end
end

# こういう風にも書ける
class My::SweetClass2
end

# 呼び出し方
my_sweet_class = My::SweetClass.new
my_sweet_class2 = My::SweetClass2.new
