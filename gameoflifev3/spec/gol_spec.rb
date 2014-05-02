require_relative "../gol"

describe TwoDimensionalCell do
  cell = TwoDimensionalCell.new(0,0)
  it 'knows if alive or dead' do
    expect(cell.isalive?).to eq(true)
  end

  it 'knows number of alive neighbors' do
    expect(cell.neighbors).to eq(0)
  end

  it 'knows the coordinates of an individual cell' do
    expect(cell.x).to eq(0)
    expect(cell.y).to eq(0)
  end

  it 'kills a cell' do
    cell.kill
    expect(cell.isalive?).to eq(false)
  end

  it 'resurrects a cell' do
    cell.resurrect
    expect(cell.isalive?).to eq(true)
  end

end

describe Game do
  context 'evolve the board according to the rules of the game' do
    it 'should return all dead' do
     board_before = []
     board_before.push TwoDimensionalCell.new(true, 0, 0, 0)
     board_before.push TwoDimensionalCell.new(false, 1, 1, 0)
     board_before.push TwoDimensionalCell.new(false, 1, 0, 1)
     board_before.push TwoDimensionalCell.new(false, 1, 1, 1)
    # [
    #  [ALIVE, DEAD],
    #  [DEAD, DEAD]
    # ]

    board_after = Game.evolve(board_before)

TwoDimensional    board_after.each do |cell|
      expect(cell.isalive?).to eq(false)
    end
     # [
     #  [DEAD,DEAD],
     #  [DEAD,DEAD]
     # ]
    end
  end

  # context 'print the board' do
  #   it 'will return the cells before and after evolve' do
  #   board_before = []
  #   board_before.push Cell.new(true, 0, 0, 0)
  #   board_before.push Cell.new(false, 1, 1, 0)
  #   board_before.push Cell.new(false, 1, 0, 1)
  #   board_before.push Cell.new(false, 1, 1, 1)

  #   print_board_before = Game.print_board(board_before)

  #   expect print_board_before. to eq([
  #     [true,]
  #   ])

  #   end
  # end


  context 'evolves the board that has 3 dead cells' do
    it 'should return middle 3 live cells' do
    board_before = []
    board_before.push TwoDimensionalCell.new(false,2,0,0)
    board_before.push TwoDimensionalCell.new(true,1,1,0)
    board_before.push TwoDimensionalCell.new(false,2,2,0)
    board_before.push TwoDimensionalCell.new(false,3,0,1)
    board_before.push TwoDimensionalCell.new(true,2,1,1)
    board_before.push TwoDimensionalCell.new(false,3,2,1)
    board_before.push TwoDimensionalCell.new(false,2,0,2)
    board_before.push TwoDimensionalCell.new(true,1,1,2)
    board_before.push TwoDimensionalCell.new(false,2,2,2)
    #   [
    #   [DEAD, ALIVE, DEAD],
    #   [DEAD, ALIVE, DEAD],
    #   [DEAD, ALIVE, DEAD]
    # ]

    board_after = Game.evolve(board_before)

    board = []
    board_after.each do |cell|
      board << cell.isalive?
    end
    expect(board).to eq([false, false, false, true, true, true, false, false, false])
    #   [
    #   [DEAD, DEAD, DEAD],
    #   [ALIVE, ALIVE, ALIVE],
    #   [DEAD, DEAD, DEAD]
    # ]
    end
  end
end

describe Underpopulate do
  it 'checks whether cell is alive and if cell has less than 2 live neighbors and returns true if conditions are met' do
    results = Underpopulate.new.is_condition_met?(TwoDimensionalCell.new(true, 0, 0, 0))
    expect(results).to eq(true)
  end

  it 'kills a cell if underpopulate conditions are met' do
    cell = TwoDimensionalCell.new(true,0, 0, 0)
    Underpopulate.new.change_state(cell)
    expect(cell.isalive?).to eq(false)
  end
end

describe Overpopulate do
  it 'checks whether cell is alive and has more than 3 live neighbors and returns true if conditions are met' do
    results = Overpopulate.new.is_condition_met?(TwoDimensionalCell.new(true, 4, 0, 0))
    expect(results).to eq(true)
  end

  it 'kills a cell if overpopulate conditions are met' do
    cell = TwoDimensionalCell.new(true, 4, 0, 0)
    Overpopulate.new.change_state(cell)
    expect(cell.isalive?).to eq(false)
  end
end

describe LiveOn do
  it 'checks whether a cell is alive and has exactly 2 or 3 live neighbors and returns true if conditions are met' do
    results = LiveOn.new.is_condition_met?(TwoDimensionalCell.new(true,2,0,0))
    expect(results).to eq(true)
  end

  it 'keeps alive state of cell if LiveOn conditions are met' do
    cell = TwoDimensionalCell.new(true, 2, 0, 0)
    LiveOn.new.change_state(cell)
    expect(cell.isalive?).to eq(true)
  end
end

describe Resurrect do
  it 'checks whether the cell is dead and has exactly 3 live neighbors and returns true if conditions are met' do
    results = Resurrect.new.is_condition_met?(TwoDimensionalCell.new(false, 3, 0, 0))
    expect(results).to eq(true)
  end

  it 'resurrects a cell if conditions for resurrection are met' do
    cell = TwoDimensionalCell.new(false,3)
    Resurrect.new.change_state(cell)
    expect(cell.isalive?).to eq(true)
  end
end
