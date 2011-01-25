@initial_values = Hash.new

def rnd x
  return (x * 5402147 + 54321) % 10000001
end

(0.. 10000001).each do |i|
  secret = rnd(i)%1000
  if @initial_values[secret] == nil
    @initial_values[secret] = Array.new
  end
  @initial_values[secret] << i
end

file = File.open(ARGV[0])


def find_secret arr
  #get possible starting values
  possible = @initial_values[arr[0]]
  if possible.size == 0 
    return -2
  end

  not_it = []
  possible.each do |s|
    secret = rnd(s)
    arr.each do |iter|
      if iter != (secret%1000)
        not_it << s
        break
      end
      secret = rnd(secret)
    end
  end
  solutions = possible - not_it
  if solutions.size > 1
    return -1
  end

  if solutions.size == 0
    return -2
  end
  
  return solutions[0]
end


num = file.readline.to_i
num.times do
  input = file.readline.split(" ").map { |i| i.to_i }
  output = find_secret(input[1..-1])

  if output == -1
    puts "Not enough observations"
    next
  end

  if output == -2
    puts "Wrong machine"
    next
  end

  #puts output.to_s + ": "

  input[0].times do
    output = rnd(output)
  end
  strings = []
  10.times do
    output = rnd(output)
    strings << (output % 1000)
  end
  puts strings.join(" ")
end
