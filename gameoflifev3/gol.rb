class Cell

  def initialize(isalive = true,neighbors = 0)
    @isalive = isalive
    @neighbors = neighbors
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
      if move_to_do != nil
        move_to_do.change_state(cell)
      else
        cell
      end
      board
    end
  end

  def self.moves
    underpopulate = Underpopulate.new
    overpopulate = Overpopulate.new
    liveon = LiveOn.new
    resurrect = Resurrect.new
    [underpopulate, overpopulate, liveon, resurrect]
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
