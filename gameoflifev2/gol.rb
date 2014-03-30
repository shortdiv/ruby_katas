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
    alive = 0
    for x_pos in x-1..x+1
      for y_pos in y-1..y+1
        if (0...board.length).include?(y_pos) && (0...board[0].length).include?(x_pos)
          if board[y_pos][x_pos] == ALIVE
            alive += 1
          end
        end
      end
    end
    if board[y][x] == ALIVE
      alive -= 1
    end
    alive
  end

  #obey rules
  def self.rules(live, isalive)
    if (isalive && live < 2) || (isalive && live > 3)
      state = DEAD
    elsif isalive && (live == 2 || live == 3)
      state = ALIVE
    elsif (not isalive) && live == 3
      state = ALIVE
    elsif (not isalive) && live < 3
      state = DEAD
    end
    state
  end

end