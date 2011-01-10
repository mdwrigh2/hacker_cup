class LexiString

  attr_accessor :str

  def initialize str
    @str = str
  end

  def <=> other

    i = 0
    while(i < other.str.size and i < @str.size) do
      if other.str[i] > @str[i]
        return -1
      end

      if other.str[i] < @str[i]
        return 1
      end
      i += 1
    end

    largerString = other.str.size > @str.size ? other.str : @str

    j = 0
    while i < largerString.size do
      if largerString[i] > largerString[j]
        return -1
      end
      if largerString[i] < largerString[j]
        return 1
      end

      j += 1
      i += 1
    end

    return 0
  end

  def to_s
    return @str
  end

end


def bestorder arr
  answer = []
  arr.each do |word|
    answer << LexiString.new(word)
  end

  return answer.sort.join
end
if ARGV.size == 1
  file = File.open(ARGV[0])

  n = file.readline.to_i

  n.times do
    puts bestorder(file.readline.split(" ")[1..-1])
  end

  file.close
end
