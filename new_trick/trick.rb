def pairs(as, bs, m, n, p, l)
  a = []
  b = []
  a[1] = as[1]
  a[2] = as[2]
  (3..n).each do |i|
    a[i] = (a[i-2]*as[3]+a[i-1]*as[4]+as[5])%p
  end

  b[1] = bs[1]
  b[2] = bs[2]
  (3..m).each do |i|
    b[i] = (b[i-2]*bs[3]+b[i-1]*bs[4]+bs[5])%p
  end
  
  count = 0
  (1..n).each do |i|
    (1..m).each do |j|
      if (a[i]*b[j])%p < l
        count += 1
      end
    end
  end
  return count
end




file = File.open(ARGV[0])

n = file.readline.to_i

n.times do
  inputs = file.readline.split(" ")
  p = inputs[0].to_i
  l = inputs[1].to_i
  
  inputs = file.readline.split(" ")
  n = inputs[0].to_i
  as = []
  (1..5).each do |i|
    as[i] = inputs[i].to_i
  end

  inputs = file.readline.split(" ")
  m = inputs[0].to_i
  bs = []
  (1..5).each do |i|
    bs[i] = inputs[i].to_i
  end

  puts pairs(as, bs, m, n, p, l)

end
