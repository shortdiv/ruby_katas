require_relative "gol"

class ConwaysProgram

  def game_board
    board = []
    board.push Cell.new(true, 0, 0, 0)
    board.push Cell.new(false, 1, 1, 0)
    board.push Cell.new(false, 1, 0, 1)
    board.push Cell.new(false, 1, 1, 1)
    board
  end


end


# generate/make board

# print board
SimpleListOfCellsToStandardOut.print ConwaysProgram.new.game_board

# Ask how many times to evolve

# evolve board specified number of times
evolved_game1 = Game.evolve ConwaysProgram.new.game_board
evolved_game2 = Game.evolve evolved_game1

# print evolved board for each evolution
puts ""
puts "Board after 1 evolution looks like this!!!"
SimpleListOfCellsToStandardOut.print evolved_game1
puts ""
puts "Board of 2nd evolution looks like this!!!"
SimpleListOfCellsToStandardOut.print evolved_game2
