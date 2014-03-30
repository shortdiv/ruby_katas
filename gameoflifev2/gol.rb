class GameofLife

  def self.evolve(board)
    board.each_with_index do |row, y|
      new_row = []
      row.each_index do |x|
        new_row << self.rules(x,y,board)
      end
      return new_row
    end
  end

  #find neighbor coordinates
  def self.neighbors(x,y,board)
    coord =[]
    for x_pos in x-1..x+1
      for y_pos in y-1..y+1
        if (0...board.length).include?(y_pos) && (0...board[0].length).include?(x_pos)
          coord.push(x:x_pos,y:y_pos)
        end
      end
    end
    coord -= [{x:x,y:y}] #remove given coord
    coord
  end

  #find state of surrounding cells
  def self.surrounding_state(x,y,board)
    neighbor_cells = self.neighbors(x,y,board)
    surrounding = []
    neighbor_cells.each do |hash|
      surrounding << board[hash.values[1]][hash.values[0]]
    end
    surrounding
  end

  #find number of live surrounding cells
  def self.live(x,y,board)
    surround_cells = self.surrounding_state(x,y,board)
    alive = 0
    surround_cells.each do |cell|
      if cell == ALIVE
        alive += 1
      end
    end
    alive
  end

  #obey rules
  def self.rules(x,y,board)
    live = self.live(x,y,board)
    if board[y][x] == ALIVE && live < 2
      state = DEAD
    elsif board[y][x] == ALIVE && live > 3
      state = DEAD
    elsif board[y][x] == ALIVE && (live == 2 || live == 3)
      state = ALIVE
    elsif board[y][x] == DEAD && live == 3
      state = ALIVE
    end
    state
  end

end