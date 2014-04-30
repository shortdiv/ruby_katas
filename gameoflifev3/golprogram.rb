require_relative "gol"

class ConwaysProgram

  def game_board
    board = []
    board.push Cell.new(true, 0, 0, 0)
    board.push Cell.new(false, 1, 1, 0)
    board.push Cell.new(false, 1, 0, 1)
    board.push Cell.new(false, 1, 1, 1)
    board
    # board2 = []
    # board2.push Cell.new(false, 2, 0, 0)
    # board2.push Cell.new(true, 1, 1, 0)
    # board2.push Cell.new(false, 2, 2, 0)
    # board2.push Cell.new(false, 3, 0, 1)
    # board2.push Cell.new(true, 2, 1, 1)
    # board2.push Cell.new(false, 3, 2, 1)
    # board2.push Cell.new(false, 2, 0, 2)
    # board2.push Cell.new(true, 1, 1, 2)
    # board2.push Cell.new(false, 2, 2, 2)
  end

end

# generate/make board

# print board
puts "initial board before evolves looks like:"
SimpleListOfCellsToStandardOut.print ConwaysProgram.new.game_board

# Ask how many times to evolve
puts "How many times would you like to evolve?"
evolves_requested = gets.chomp.to_i

# evolve board specified number of times
evolves_so_far = 1
game_board = Game.evolve ConwaysProgram.new.game_board #first evolve
puts "board after #{evolves_so_far} evolves"
SimpleListOfCellsToStandardOut.print game_board

while evolves_so_far < evolves_requested do
  game_board = Game.evolve game_board
  evolves_so_far += 1
  puts ""
  puts "Board after #{evolves_so_far} evolves"
  SimpleListOfCellsToStandardOut.print game_board
end
