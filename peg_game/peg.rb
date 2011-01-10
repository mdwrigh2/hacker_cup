class Peg
  attr_accessor :val, :e

  def initialize x, e
    @val = x
    @e = e
  end

  def is_end?
    return e
  end

  def to_s
    return "E" if @val == 1 and @e
    return "x" if @val == 1
    return "."
  end
end


class Board
  attr_accessor :b, :rows

  def initialize r, c
    @rows = r-1
    @b = []
    (0..r-1).each do |i|
      temp = []
      if i % 2 == 0
        top = c*2-2
      else
        top = c*2-4
      end
      (0..top).each do |n|
        if n == 0 or n == top
          e = true
        else
          e = false
        end
        if n%2 == 0
          temp << Peg.new(1, e)
        else 
          temp << Peg.new(0, e)
        end
      end
      @b << temp
    end
  end

  def remove_peg r, c
    @b[r][c*2].val = 0
  end
    

  def to_s
    string = ""
    @b.each_with_index do |arr, index|
      string += "  " if (index%2) == 1
      arr.each do |i|
        string += i.to_s+" "
      end
      string += "\n"
    end
    return string
  end
end


class SlotProbability
  attr_accessor :prob, :id

  def initialize id prob
    @prob = prob
    @id = id
  end
    
  def <=>other
    t = @prob.<=>(other.prob)
    return t unless t == 0
    return @id.<=>(other.id)
  end


end
def probability(row, column, board, goal, probability)
  puts "Row: #{row} Column: #{column}"

  if row % 2 == 0
    offset = -1
  else
    offset = 1
  end

  if board.b[row][column].val == 0
    if row == board.rows
      return probability if column == goal
      return 0
    end
    return probability(row+1, column+offset, board, goal, probability)
  else
    if board.b[row][column].e
      if column == 0
        return probability(row, column+1, board, goal, probability)
      else
        return probability(row, column-1, board, goal, probability)
      end
    else
      return probability(row, column+1, board, goal, probability*0.5) + probability(row, column-1, board, goal, probability*0.5)
    end
  end
end

file = File.open(ARGV[0])
n = file.readline.to_i

n.times do
  input = file.readline.split(" ")
  board = Board.new(input[0].to_i,input[1].to_i)
  goal = input[2].to_i
  goal = 2*goal +1
  m = input[3].to_i
  m.times do |i|
    board.remove_peg(input[2*i+4].to_i, input[2*i+5].to_i)
  end
  puts board
  puts goal
  answer = []
  (0..input[1].to_i-2).each do |i|
    puts "#{i}: #{probability(0, 2*i+1, board, goal, 1)}"
  end
  puts ""
  puts "-------------------"
  puts ""
end

