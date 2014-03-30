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
    coord =[]
    for x_pos in x-1..x+1
      for y_pos in y-1..y+1
        if (0..board.length).include?(y_pos) && (0..board[0].length).include?(x_pos)
          coord.push(x:x_pos,y:y_pos)
        end
      end
    end
    coord -= [{x:x,y:y}] #remove given coord
  end

  def self.live(x,y,board)
    alive = []
    neighbor_cells = self.neighbors(x,y,board)
    neighbor_cells.each do |hash|
      alive << board[hash.values[1]][hash.values[0]]
    end
    alive
  end

end