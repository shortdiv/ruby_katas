require File.join(File.dirname(__FILE__), "spec_helper" )
require_relative "../gol"

DEAD = "dead"
ALIVE = "alive"

describe GameofLife do
  it 'when given a 2x2 gameboard of 1 live cell in upper right return an all dead board' do
    board_before =
    [
      [ALIVE, DEAD],
      [DEAD, DEAD]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
        [0,0],
        [0,0]
      ])
  end

  it 'when given a 3X2 gameboard with 1 live cell in upper right return all dead board' do
    board_before =
    [
      [ALIVE, DEAD, DEAD],
      [DEAD, DEAD, DEAD]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
        [0,0,0],
        [0,0,0]
      ])
  end

  it 'when given a board of 3x3 with 3 vertical live cells in the middle return 3 middle horizontal live cells' do
    board_before =
    [
      [DEAD, ALIVE, DEAD],
      [DEAD, ALIVE, ALIVE],
      [DEAD, ALIVE, ALIVE]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
        [0,0,0],
        [1,1,1],
        [0,0,0]
      ])
  end
end





