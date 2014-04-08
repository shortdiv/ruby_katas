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
      if cell.isalive? && cell.neighbors == 0
        cell.kill
      end
    end
    board
  end
end

class Underpopulate < Cell
  def is_condition_met?(isalive, neighbors)
    isalive == true && neighbors < 2
  end

  def change_state
    kill
  end
end

class Overpopulate < Cell
  def is_condition_met?(isalive, neighbors)
    isalive == true && neighbors > 3
  end

  def change_state
    kill
  end
end

class LiveOn < Cell
  def is_condition_met?(isalive, neighbors)
    isalive == true && (neighbors == 2 || neighbors == 3)
  end

  def change_state
    keepalive
  end
end

class Resurrect < Cell
  def is_condition_met?(isalive, neighbors)
    isalive == false && neighbors == 3
  end

  def change_state
    resurrect
  end
end
