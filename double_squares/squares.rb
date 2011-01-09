def squares x
  answer = 0 
  top = Math.sqrt(x).floor
  (0..top).each do |m|
    (0..m).each do |n|
      answer += 1 if (m**2)+(n**2) == x
    end
  end
  return answer
end

file = File.open(ARGV[0])

num = file.readline.to_i
num.times do
  puts squares(file.readline.to_i)
end
