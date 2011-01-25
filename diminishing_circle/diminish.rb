class Person
  attr_accessor :prev, :next, :index

  def initialize index
    @index = index
  end

  def to_s
    return index.to_s
  end

end

#Setup the circle, pass return the first person

def circle_setup n
  first = Person.new 0
  prev = first
  (1..n-1).each do |i|
    p = Person.new(i)
    prev.next = p
    p.prev = prev
    prev = p
  end
  first.prev = prev
  prev.next = first
  return first
end

def remove p
  p.prev.next = p.next
  p.next.prev = p.prev
end

def move n, p
  n.times do
    p = p.next
  end
  return p
end

file = File.open(ARGV[0])

file.readline.to_i.times do
  input = file.readline.split(" ")
  n = input[0].to_i
  k = (input[1].to_i+1)
  p = circle_setup n
  while n > 1
    p = move (k%n), p
    remove p
    n = n-1
  end
  puts p.next
end

