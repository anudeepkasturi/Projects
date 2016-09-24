

class TowersofHanoi
  attr_reader :stacks

  def initialize
    @stacks = [[3, 2, 1], [], []]
  end

  def move(move_values)
    x, y = move_values
    valid_moves(x, y)
    @stacks[y].push(@stacks[x].pop)
  end

  def valid_moves(x, y)
    unless x.between?(0, 2) && y.between?(0, 2)
      raise "must choose a valid stack"
    end

    if @stacks[x].empty?
      raise "can't move from an empty stack"
    end

    if !@stacks[y].empty? && (@stacks[x].last > @stacks[y].last)
      raise "can't move a bigger disk to a smaller disk"
    end


  end

  def play
    until won?
      render
      move(get_moves)
    end
    render
    puts "you win!"
  end

  def render
    p @stacks
  end

  def won?
    @stacks[1].count == 3 || @stacks[2].count == 3
  end

  private
  def get_moves
    puts "Please enter a stack to take from."
    from = Integer(gets.chomp)
    puts "Please enter the stack to move to."
    to = Integer(gets.chomp)
    [from, to]
  end
end

if __FILE__ == $PROGRAM_NAME
  TowersofHanoi.new.play
end
