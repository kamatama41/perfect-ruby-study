# 4-2-1 モジュールの特徴
module Sweet
  def self.lot
    %w(brownie apple-pie bavarois pudding).sample
  end
end

puts Sweet.lot
puts Sweet.lot