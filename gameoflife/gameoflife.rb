class Game
  def initialize
    @board = [ [false, false, false, false, false],
               [false, false, false, true, false],
               [false, false, true, false, false],
               [false, true, false, false, false],
               [false, false, false, false, false]
             ]
  end

  def game_board

    @board.each do |row|
      row_status = ""
      row.each do |piece|
        if piece == true
          row_status << "X"
        else
          row_status << "O"
        end
      end
    # puts row_status
    end
  end

  # Create transitions
  def transition
    @board.each_with_index do |row, y|
      assembled = ""
      row.each_index do |x|
        assembled << find_neighbors(x,y).to_s
      end
       puts assembled
    end
  end

  #finds neighboring elements
  def find_neighbors(x,y)
    truths = 0
    for x_Pos in x-1..x+1
      for y_Pos in y-1..y+1
        if (0...@board.length).include?(x_Pos) && (0...@board[0].length).include?(y_Pos)
          if @board[x_Pos][y_Pos] == true
            truths += 1
          end
        end
      end
    end

    if @board[x][y] == true
      truths -= 1
    end

    return truths

  end
end