class GameofLife

  def self.evolve(board)
    new_board = []
    board.each_with_index do |row, rownum|
      new_row = []
      row.each_with_index do |cell, cellnum|
        if cell == ALIVE && board[rownum][cellnum - 1] == ALIVE #checks if items next to piece is alive
          new_row << 1
        else
          new_row << 0
        end
      end
      new_board << new_row
    end
    return new_board
  end


end