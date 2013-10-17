array = [10,20,30,40]

def array.swap(n1, n2)
  if n1 < 0 || n1 >= self.length
    return self.clone
  end

  if n2 < 0 || n2 >= self.length
    return self.clone
  end

  result = []
  self.each_with_index do |v, i|
    if i == n1
      result[n2] = v
    elsif i == n2
      result[n1] = v
    else
      result[i] = v
    end
  end
  result
end

def array.swap!(n1, n2)
  if n1 < 0 || n1 >= self.length
    return
  end

  if n2 < 0 || n2 >= self.length
    return
  end

  tmp = self[n1]
  self[n1] = self[n2]
  self[n2] = tmp
end


puts array.swap(1, 3).inspect
puts array.inspect

array.swap!(1, 3)
puts array.inspect