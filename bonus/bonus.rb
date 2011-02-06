def coprimes(i, a, b)
  coprimes = []
  s = i
  (a..b).each do |j|
    if j%i != 0
      coprimes << j
    end
  end
  return coprimes
end

def combin(n, a, b, c,d)
  # note that 1 is a degenerate case
  comb = []
  count = 0
  (2..d).each do |i|
    cp = coprimes(i,a,d)
    lower = cp.reject {|i| i > b}
    if lower.empty?
      next
    end
    upper = cp.reject {|i| i < c} 
    if upper.empty?
      next
    end
    if cp.size >= n
      comb << cp
    end
  end
  return comb
end

p combin(2,1,2,4,5)
