require_relative "../gol"

describe Cell do
  it 'knows if alive or dead' do
    expect(subject.isalive?).to eq(true)
  end

  it 'knows number of alive neighbors' do
    expect(subject.neighbors).to eq(0)
  end

  it 'kills a cell' do
    subject.kill
    expect(subject.isalive?).to eq(false)
  end

  it 'resurrects a cell' do
    subject.resurrect
    expect(subject.isalive?).to eq(true)
  end

end

describe Game do
  it 'evolve the board according to the rules of the game' do
    board_before = []
    board_before.push Cell.new(true, 0)
    board_before.push Cell.new(false, 1)
    board_before.push Cell.new(false, 1)
    board_before.push Cell.new(false, 1)
    # [
    #  [ALIVE, DEAD],
    #  [DEAD, DEAD]
    # ]

    board_after = Game.evolve board_before

    board_after.each do |cell|
      expect(cell.isalive?).to eq(false)
    end
     # [
     #  [DEAD,DEAD],
     #  [DEAD,DEAD]
     # ]
  end
end

describe Underpopulate do
  it 'checks whether cell is alive and if cell has less than 2 live neighbors and returns true if conditions are met' do
    results = Underpopulate.new.is_underpopulated?(true, 1)
    expect(results).to eq(true)
  end

  it 'kills a cell if underpopulate conditions are met' do
    underpopulate = Underpopulate.new
    underpopulate.change_state
    expect(underpopulate.isalive?).to eq(false)
  end
end
