class Game

  def initialize(x)
    @board = x
  end

  #prints current state of board
  def print_board
    @board.each do |row|
      row_status = ""
      row.each do |piece|
        if piece == true
          row_status << "X"
        else
          row_status << "O"
        end
      end
      puts row_status
    end
  end

  # Currently checks neighboring elements, prints multi-array
  # should update the board acc to rules
  def run
    print_board
    temp_board = []
    @board.each_with_index do |row, y|
      temp_row = []
      row.each_index do |x|
        neighbor = find_neighbors(x,y)
        temp_row <<  deadoralive(neighbor, @board[y][x])
      end
      temp_board << temp_row
    end
    @board = temp_board
    puts
    print_board
    return @board
  end

  #finds neighboring live cells
  def find_neighbors(x,y)
    truths = 0
    for y_Pos in y-1..y+1
      for x_Pos in x-1..x+1
        if (0...@board.length).include?(x_Pos) && (0...@board[0].length).include?(y_Pos)
          if @board[y_Pos][x_Pos] == true
            truths += 1
          end
        end
      end
    end

    if @board[y][x] == true
      truths -= 1
    end

    return truths

  end

  # is the piece alive or dead according to the rules of the game
  def deadoralive(num, isalive)
    if (isalive && (num < 2)) || (isalive && (num > 3))
      #PIECE IS NOW DEAD
      false
    elsif (isalive && (num == 2)) || (isalive && (num == 3))
      #PIECE IS NOW LIVE
      true
    elsif ((not isalive) && (num == 3))
     # PIECE IS ALIVE only if dead
     true
    elsif ((not isalive) && (num < 3))
      false
    end

  end

end
