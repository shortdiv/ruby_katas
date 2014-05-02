require_relative "gol"

class ConwaysProgram

  def twod_game_board
    boards = []
    board1 = []
    board1.push TwoDimensionalCell.new(true, 0, 0, 0)
    board1.push TwoDimensionalCell.new(false, 1, 1, 0)
    board1.push TwoDimensionalCell.new(false, 1, 0, 1)
    board1.push TwoDimensionalCell.new(false, 1, 1, 1)
    # board2 = []
    # board2.push TwoDimensionalCell.new(false, 2, 0, 0)
    # board2.push TwoDimensionalCell.new(true, 1, 1, 0)
    # board2.push TwoDimensionalCell.new(false, 2, 2, 0)
    # board2.push TwoDimensionalCell.new(false, 3, 0, 1)
    # board2.push TwoDimensionalCell.new(true, 2, 1, 1)
    # board2.push TwoDimensionalCell.new(false, 3, 2, 1)
    # board2.push TwoDimensionalCell.new(false, 2, 0, 2)
    # board2.push TwoDimensionalCell.new(true, 1, 1, 2)
    # board2.push TwoDimensionalCell.new(false, 2, 2, 2)
    # boards = []
  end

  def threed_game_board
    board2 = []
    board2.push ThreeDimensionalCell.new(true, 0, 0, 0, 0)
    board2.push ThreeDimensionalCell.new(false, 1, 1, 0, 0)
    board2.push ThreeDimensionalCell.new(false, 1, 0, 1, 0)
    board2.push ThreeDimensionalCell.new(false, 1, 1, 1, 0)
  end

end

# generate/make single dimensional board

# print board
game_board = ConwaysProgram.new.threed_game_board

game_board = ThreeDBoardNeighborCalculator.new.calculate game_board
puts "initial board before evolves looks like:"
SimpleListOfCellsToStandardOut.print game_board

# Ask how many times to evolve
puts "How many times would you like to evolve?"
evolves_requested = gets.chomp.to_i

#Ask which board you want to evolve

# evolve board specified number of times
evolves_so_far = 1
game_board = Game.evolve game_board #first evolve
puts "board after #{evolves_so_far} evolves"
SimpleListOfCellsToStandardOut.print game_board

while evolves_so_far < evolves_requested do
  game_board = Game.evolve game_board
  evolves_so_far += 1
  puts ""
  puts "Board after #{evolves_so_far} evolves"
  SimpleListOfCellsToStandardOut.print game_board
end


# #**** print 3D board
# puts "initial 3D board before evolves looks like:"
# ThreeDimensionalCellstoStandardOut.print ConwaysProgram.new.game_board
# # Ask how many times to evolve
# puts "How many times would you like to evolve?"
# evolves_requested = gets.chomp.to_i

# #Ask which board you want to evolve

# # evolve board specified number of times
# evolves_so_far = 1
# game_board = Game.evolve ConwaysProgram.new.game_board #first evolve
# puts "board after #{evolves_so_far} evolves"
# ThreeDimensionalCellstoStandardOut.print game_board

# while evolves_so_far < evolves_requested do
#   game_board = Game.evolve game_board
#   evolves_so_far += 1
#   puts ""
#   puts "Board after #{evolves_so_far} evolves"
#   ThreeDimensionalCellstoStandardOut.print game_board
# end

