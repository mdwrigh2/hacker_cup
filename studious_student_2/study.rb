@c = Hash.new()

def changes(str)
  if !@c[str].nil?
    return @c[str]
  end
  ps = 1
  if str.size == 1
    return 1
  end
  (0...str.size).each do |i|
    (i+1...str.size).each do |j|
      if str[i..j].include? "a"
        new_str =  str[0...i]+"a"+str[j+1...str.size]
        ps += changes(new_str)
        #puts "i: #{i}, j: #{j}"
        #puts "str[0...i] = #{str[0...i]}"
        #puts "str[j+1...str.size] = #{str[j+1...str.size]}"
        #puts str[0...i]+"a"+str[j+1...str.size]
      end
      if str[i..j].include? "b"
        new_str = str[0...i]+"b"+str[j+1...str.size]
        ps += changes(new_str)
      end
    end
  end
  @c[str] = ps
  return ps
end

file = File.open(ARGV[0])

n = file.readline.to_i

n.times do
  str = file.readline.chomp
  puts changes(str)
end
