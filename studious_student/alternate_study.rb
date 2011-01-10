require './study.rb'

def check words
  answer = []
  words.permutation.each do |p|
    answer << p.join
  end
  answer.sort!
  return answer[0]
end

file = File.open(ARGV[0])
n = file.readline.to_i

sol_set = []
n.times do
  words = file.readline.split(" ")[1..-1]
  arr = []
  words.each do |word|
    arr << String.new(word)
  end
  c = check(arr)
  sol_set << c
  b = bestorder(arr)
  if c != b
    puts "-----------------------------------"
    puts "FALSE!\n\tCheck: #{c}\n\tBest: #{b}"
    answer = [] 
    answer << b
    answer << c
    answer.sort!
    if answer[0] == b
      puts "BEST is correct!"
    else
      puts "CHECK is correct!"
    end
    puts "-----------------------------------"
  else
    puts "True"
  end
end

sol_set.each do |word|
  puts word
end
