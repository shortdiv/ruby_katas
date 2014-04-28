class Cell
  attr_accessor :x, :y

  def initialize(isalive = true,neighbors = 0,x,y)
    @isalive = isalive
    @neighbors = neighbors
    self.x = x
    self.y = y
  end

  def isalive?
    @isalive
  end

  def neighbors
    @neighbors
  end

  def kill
    @isalive = false
  end

  def resurrect
    @isalive = true
  end

  def keepalive
    @isalive = true
  end

end


class Game

  def self.evolve(board)
    board.each do |cell|
      move_to_do = moves.select {|move| move.is_condition_met?(cell)}.first
      move_to_do.change_state(cell)
    end
    board
  end

  def self.moves
    underpopulate = Underpopulate.new
    overpopulate = Overpopulate.new
    liveon = LiveOn.new
    resurrect = Resurrect.new
    noapplicablerule = NoApplicableRule.new
    [underpopulate, overpopulate, liveon, resurrect, noapplicablerule]
  end

  # print entire board => print out cells linearly, only alive/dead
end

class SimpleListOfCellsToStandardOut

  def self.print(board)
    board.each do |cell|
      if cell.isalive?
        puts "is alive with #{cell.neighbors} neighbors"
      else
        puts "is dead with #{cell.neighbors} neighbors"
      end
    end
  end

end

class Underpopulate
  def is_condition_met?(cell)
    cell.isalive? == true && cell.neighbors < 2
  end

  def change_state(cell)
    cell.kill
  end
end

class Overpopulate
  def is_condition_met?(cell)
    cell.isalive? == true && cell.neighbors > 3
  end

  def change_state(cell)
    cell.kill
  end
end

class LiveOn
  def is_condition_met?(cell)
    cell.isalive? == true && (cell.neighbors == 2 || cell.neighbors == 3)
  end

  def change_state(cell)
    cell.keepalive
  end
end

class Resurrect
  def is_condition_met?(cell)
    cell.isalive? == false && cell.neighbors == 3
  end

  def change_state(cell)
    cell.resurrect
  end
end


class NoApplicableRule
  def is_condition_met?(cell)
    true
  end

  def change_state(cell)
    cell
  end
end
