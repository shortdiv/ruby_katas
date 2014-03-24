require_relative "gameoflife"


describe Game do

  # before do
  #   @game = Game.new([ [false, false, false, false, true],
  #              [false, false, false, true, true],
  #              [false, false, true, false, false],
  #              [false, true, false, false, false],
  #              [false, false, false, false, false] ])
  # end

  # context 'return of dead or alive' do
  #   it 'returns t/f' do
  #   @game.deadoralive(1, true).should == false
  #   @game.deadoralive(5, true).should == false
  #   @game.deadoralive(2, true).should == true
  #   @game.deadoralive(3, false).should == true
  #   @game.deadoralive(0, false).should == false
  #   end
  # end

  # before do
  #   @game = Game.new([ [false, false, false, false, false],
  #                     [false, false, true, false, false],
  #                     [false, false, true, false, false],
  #                     [false, false, true, false, false],
  #                     [false, false, false, false, false] ])
  # end

  # context 'find neighbors check' do
  #   it 'check the function find neighbors' do
  #     @game.find_neighbors(3,0).should == 1
  #     @game.find_neighbors(0,4).should == 0
  #     @game.find_neighbors(4,3).should == 0
  #   end
  # end

  # context 'when given a board with blinker pattern' do
  #   it 'updates the board according to rules' do
  #     @game.run.should == [ [false, false, false, false, false],
  #                     [false, false, false, false, false],
  #                     [false, true, true, true, false],
  #                     [false, false, false, false, false],
  #                     [false, false, false, false, false] ]
  #   end
  # end

  before do
    @game = Game.new([ [false, false, false, false, false],
                      [true, true, false, false, false],
                      [true, true, false, false, false],
                      [false, false, true, true, false],
                      [false, false, true, true, false] ])
  end

  context 'when given a board with blinker pattern' do
    it 'updates the board according to rules' do
      @game.run.should == [ [false, false, false, false, false],
                      [true, true, false, false, false],
                      [true, false, false, false, false],
                      [false, false, false, true, false],
                      [false, false, true, true, false] ]
    end
  end

  # context 'when given initial board' do
  #   it 'updates the board according to rules' do
  #   @game.run
  #   @game.should == [[false, false, false, true, true], [false, false, false, true, true], [false, false, true, true, false],[false, false, false, false, false],[false, false, false, false, false] ]
  #   end
  # end


end

