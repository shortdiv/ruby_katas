require_relative "gameoflife"


describe Game do
  before do
    @game = Game.new
  end

  context 'return of dead or alive' do
    it 'returns t/f' do
    @game.deadoralive(1, true).should == false
    @game.deadoralive(5, true).should == false
    @game.deadoralive(2, true).should == true
    @game.deadoralive(3, false).should == true
    end
  end

  context 'checks returned board' do
    it 'updates the board' do
    @game.run
    @game.should == [[false, false, false, true, true], [false, false, false, true, true], [false, false, true, true, false],[false, false, false, false, false],[false, false, false, false, false] ]
    end
  end

  context 'find neighbors check' do
    it 'check the function find neighbors' do
      @game.find_neighbors(0,3).should == 3
      @game.find_neighbors(4,0).should == 1
      @game.find_neighbors(3,4).should == 0
    end
  end

end

