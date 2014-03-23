class Game

  #creates a board
  def initialize
    @board = [ [false, false, false, false, true],
               [false, false, false, true, true],
               [false, false, true, false, false],
               [false, true, false, false, false],
               [false, false, false, false, false]
             ]
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
    temp_board = []
    print_board
    @board.each_with_index do |row, y|
      temp_row = []
      row.each_index do |x|
        neighbor = find_neighbors(x,y)
        deadoralive(neighbor, @board[x][y])
        temp_row << deadoralive(x,y)
      end
      temp_board << temp_row
    end
    @board = temp_board
    puts #create space
    print_board
  end

  #finds neighboring live cells
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

  # is the piece alive or dead according to the rules of the game
  def deadoralive(num, isalive)
    if (isalive && num < 2) || (isalive && num > 3)
      #PIECE IS NOW DEAD
      false
    elsif (isalive && num == 2) || (isalive && num == 3)
      #PIECE IS NOW LIVE
      true
    elsif not isalive && num == 3
     # PIECE IS ALIVE only if dead
     true
    end
  end

end

game = Game.new
# print game.run


# what variables go outside the range
# => x_Pos, y_Pos

# for each variable what is their valid range
# => x_Pos within 0 - 4 Board[0].length => x
# => y_Pos within 0 - 4 Board.length => y

# how do you check valid range
# => (0..Board[0].length).include?(x_Pos)
# => (0..Board.length).include?(y_Pos)

#What am I expecting? (definitely not a baby, thank god)
# What do I get?
# Is it what I'm expecting, if not, why? <- Andrew's questions to me. </3


## readability, build diff levels of feedback
