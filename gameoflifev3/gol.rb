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

end

class Game
  def self.evolve(board)
    board
  end
end
