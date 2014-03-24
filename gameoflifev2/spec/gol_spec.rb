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

  it 'when given a board of 2x2 with all live cells return no all live board' do
    board_before =
    [
      [ALIVE, ALIVE],
      [ALIVE, ALIVE]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
      [1,1],
      [1,1]
      ])
  end


end





