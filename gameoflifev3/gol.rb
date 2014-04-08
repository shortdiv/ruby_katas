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