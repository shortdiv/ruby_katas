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
end





