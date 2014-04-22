require File.join(File.dirname(__FILE__), "spec_helper" )
require_relative "../gol"

DEAD = "dead"
ALIVE = "alive"

describe GameofLife do

  context 'when given a 2x2 board, check if no of live cells is < 2 and whether cell is alive' do
    it 'should be underpopulated' do
      results = GameofLife::Underpopulate.new.is_it_happening?(ALIVE,1)
      results.should eq(true)
    end

    it 'should kill cell' do
      results = GameofLife::Underpopulate.new.next_state
      expect(results).to eq(DEAD)
    end
  end

  context 'when given a 2x2 board, check if no of live cells is > 3 and whether the cell is alive' do
    it 'should be overpopulated' do
      results = GameofLife::Overpopulate.new.is_it_happening?(ALIVE,4)
      expect(results).to eq(true)
    end

    it 'should kill cell' do
      results = GameofLife::Overpopulate.new.next_state
      expect(results).to eq(DEAD)
    end
  end

  context 'when given a 2x2 board, check if no of live cells is equal to 2 or 3 and cell is alive' do
    it 'should be static' do
      results = GameofLife::Survive.new.is_it_happening?(ALIVE,2)
      expect(results).to eq(true)
    end

    it 'should let cell live' do
      results = GameofLife::Survive.new.next_state
      expect(results).to eq(ALIVE)
    end
  end

  context 'when given 2x2 board, check if no of live cells is equal to 3 and cell is dead' do
    it 'should be revived' do
      results = GameofLife::Revive.new.is_it_happening?(DEAD,3)
      expect(results).to eq(true)
    end

    it 'should let cell come alive' do
      results = GameofLife::Revive.new.next_state
      expect(results).to eq(ALIVE)
    end
  end

  context 'when given a 2x2 board check if no of cells is less than 3 and cell is dead' do
    it 'should remain dead' do
      results = GameofLife::StayDead.new.is_it_happening?(DEAD,2)
      expect(results).to eq(true)
    end
    it 'should let cell stay dead' do
      results = GameofLife::StayDead.new.next_state
      expect(results).to eq(DEAD)
    end
  end

  xit 'when given a 2x2 gameboard of 1 live cell in upper right return an all dead board' do
    board_before =
    [
      [ALIVE, DEAD],
      [DEAD, DEAD]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
        [DEAD,DEAD],
        [DEAD,DEAD]
      ])
  end

  xit 'when given a 3X2 gameboard with 1 live cell in upper right return all dead board' do
    board_before =
    [
      [ALIVE, DEAD, DEAD],
      [DEAD, DEAD, DEAD]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
        [DEAD,DEAD,DEAD],
        [DEAD,DEAD,DEAD]
      ])
  end


  xit 'when given a board of 3x3 with middle vertical live cells return middle horizontal live board' do
    board_before =
    [
      [DEAD, ALIVE, DEAD],
      [DEAD, ALIVE, DEAD],
      [DEAD, ALIVE, DEAD]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
      [DEAD,DEAD,DEAD],
      [ALIVE,ALIVE,ALIVE],
      [DEAD,DEAD,DEAD]
      ])
  end

  xit 'when given a 4x4 of pattern toad implement' do
        board_before =
    [
      [DEAD, DEAD, DEAD, DEAD],
      [DEAD, ALIVE, ALIVE, ALIVE],
      [ALIVE, ALIVE, ALIVE, DEAD],
      [DEAD, DEAD, DEAD, DEAD]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
      [DEAD,DEAD,ALIVE,DEAD],
      [ALIVE,DEAD,DEAD,ALIVE],
      [ALIVE,DEAD,DEAD,ALIVE],
      [DEAD,ALIVE,DEAD,DEAD]
      ])
  end

  xit 'when given a 4x4 of pattern beacon implement' do
        board_before =
    [
      [ALIVE, ALIVE, DEAD, DEAD],
      [ALIVE, ALIVE, DEAD, DEAD],
      [DEAD, DEAD, ALIVE, ALIVE],
      [DEAD, DEAD, ALIVE, ALIVE]
    ]

    board_after = GameofLife.evolve board_before

    board_after.should eq([
      [ALIVE,ALIVE,DEAD,DEAD],
      [ALIVE,DEAD,DEAD,DEAD],
      [DEAD,DEAD,DEAD,ALIVE],
      [DEAD,DEAD,ALIVE,ALIVE]
      ])
  end

  xit 'when given a board of 2x2 return coordinates of neighbors for 0,0 return surrounding valid coords' do
    board =
    [
      [DEAD,DEAD],
      [DEAD,DEAD]
    ]

    possible_coordinates = GameofLife.neighbors(0,0,board)

    possible_coordinates.should eq(0)

  end

end

