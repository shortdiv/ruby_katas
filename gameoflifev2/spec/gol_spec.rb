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

  it 'when given a board of 2x2 with all live cells return all live board' do
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

  it 'when given a board of 2x2 return coordinates of neighbors for 0,0 return surrounding valid coords' do
    board =
    [
      [DEAD,DEAD],
      [DEAD,DEAD]
    ]

    possible_coordinates = GameofLife.neighbors(0,0,board)

    possible_coordinates.should eq([
      {:x=>0, :y=>1},
      {:x=>1, :y=>0},
      {:x=>1, :y=>1}
      ])
  end

  it 'when given a 2x2 with dead cells return number of surrounding live cells for 0,0' do
     board =
    [
      [DEAD,DEAD],
      [DEAD,DEAD]
    ]

    results = GameofLife.live(0,0,board)

    results.should eq(0)
  end

end

  #   it 'when given a board of 3x3 with middle vertical live cells return middle horizontal live board' do
  #   board_before =
  #   [
  #     [DEAD, ALIVE, DEAD],
  #     [DEAD, ALIVE, DEAD],
  #     [DEAD, ALIVE, DEAD]
  #   ]

  #   board_after = GameofLife.evolve board_before

  #   board_after.should eq([
  #     [0,0,0],
  #     [1,1,1],
  #     [0,0,0]
  #     ])
  # end







