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
    @prob = []
    (0..r-1).each do |i|
      temp = []
      prob_temp = []
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
          prob_temp << nil
        else 
          temp << Peg.new(0, e)
          prob_temp << nil
        end
      end
      @b << temp
      @prob << prob_temp
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
  def probability(row, column, goal, probability)

    if row % 2 == 0
      offset = -1
    else
      offset = 1
    end

    if @prob[row][column] != nil
      return @prob[row][column]*probability
    end

    if @b[row][column].val == 0
      if row == @rows
        return probability if column == goal
        return 0
      end
      return probability(row+1, column+offset, goal, probability)
    else
      if @b[row][column].e
        if column == 0
          return probability(row, column+1, goal, probability)
        else
          return probability(row, column-1, goal, probability)
        end
      else
        return probability(row, column+1, goal, probability*0.5) + probability(row, column-1, goal, probability*0.5)
      end
    end
  end
end


class SlotProbability
  attr_accessor :prob, :id

  def initialize id, prob
    @prob = prob
    @id = id
  end
    
  def <=>other
    t = @prob.<=>(other.prob)
    return t unless t == 0
    return @id.<=>(other.id)
  end

  def to_s
    return "#{@id}"+" %.6f" % @prob
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
  # puts board
  # puts goal
  answer = []
  (0..input[1].to_i-2).each do |i|
    answer << SlotProbability.new(i, board.probability(0, 2*i+1,goal, 1))
  end
  puts answer.sort.reverse.shift
end

