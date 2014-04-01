class GameofLife

  def self.evolve(board)
    new_board = []
    board.each_with_index do |row, y|
      new_row = []
      row.each_index do |x|
        neighbor = self.neighbors(x,y,board)
        new_row << self.rules(neighbor, board[y][x])
      end
      new_board << new_row
    end
    new_board
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
    underpopulate = Underpopulate.new
    overpopulate = Overpopulate.new
    survive = Survive.new
    revive = Revive.new
    staydead = StayDead.new


    if underpopulate.is_it_happening?(live, isalive)
      state = Underpopulate.new.next_state
    elsif Overpopulate.new.is_it_happening(live, isalive)
      state = Overpopulate.new.next_state
    elsif Survive.new.is_it_happening(live, isalive)
      state = Survive.new.next_state
    elsif Revive.new.is_it_happening(live, isalive)
      state = Revive.new.next_state
    elsif StayDead.new.is_it_happening(live, isalive)
      state = StayDead.new.next_state
    end
    state
  end

  #splitting up rules
  class Underpopulate
    def is_it_happening?(isalive, live)
      (isalive == ALIVE && live < 2)
    end

    def next_state
      state = DEAD
    end
  end

  class Overpopulate
    def is_it_happening?(isalive, live)
      isalive == ALIVE && live > 3
    end

    def next_state
      state = DEAD
    end
  end

  class Survive
    def is_it_happening?(isalive, live)
      isalive == ALIVE && (live == 2 || live == 3)
    end

    def next_state
      state = ALIVE
    end
  end

  class Revive
    def is_it_happening?(isalive,live)
      (isalive == DEAD) && (live == 3)
    end

    def next_state
      state = ALIVE
    end
  end

  class StayDead
    def is_it_happening?(isalive,live)
      (isalive != ALIVE) && live < 3
    end

    def next_state
      state = DEAD
    end
  end

end