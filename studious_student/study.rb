def bestorder arr
  return arr.sort.join
end

file = File.open(ARGV[0])

n = file.readline.to_i

n.times do
  puts bestorder(file.readline.split(" ")[1..-1])
end
