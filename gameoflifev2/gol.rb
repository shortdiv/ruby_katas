class GameofLife

  def self.evolve(board)
    new_board = []
    board.each_with_index do |row, y|
      new_row = []
      row.each_with_index do |cell, x|
        if cell == ALIVE && (board[y][x - 1] == ALIVE) #if cells next to it are alive
          new_row << 1
        else
          new_row << 0
        end
      end
      new_board << new_row
    end
    return new_board
  end

  #create method to find neighbors
  def self.neighbors(x,y,board)
    [
    {x: x-1,y: y-1},
    {x: x, y: y-1},
    {x: x+1, y: y-1},
    {x: x-1, y: y},
    {x: x+1, y: y},
    {x: x-1, y: y+1},
    {x: x, y: y+1},
    {x: x+1, y: y+1},
  ]
  end

  def self.positive(coord)
    possible_coordinates=[]
    coord.each do |hash|
      if hash[:x]>=0 && hash[:y]>=0
        possible_coordinates << hash
      end
    end
    possible_coordinates
  end

    def self.live(coord)
      self.positive(coord).length
    end
end