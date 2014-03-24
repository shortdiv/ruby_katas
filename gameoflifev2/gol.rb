class GameofLife

  def self.evolve(board)
    new_board = []
    board.each do |row|
      new_row = []
      row.each do |cell|
        if cell
          new_row << 0
        end
      end
    new_board << new_row
    end
    return new_board
  end

end