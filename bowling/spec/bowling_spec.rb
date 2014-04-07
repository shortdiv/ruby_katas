require_relative '../bowling'

describe Game do

  it "has a zero score" do
    pending
    expect(subject.calculate_total_score).to eq(0)
  end

  describe "Rolling a Ball" do
    it "changes the score" do
      pending
      game = Game.new
      game.roll(4)
      expect(game.calculate_total_score).to eq(4)
    end
  end

  describe "Rolling 2 balls" do
    it "adds two scores" do
      pending
      game = Game.new
      game.roll(4)
      game.roll(3)
      expect(game.calculate_total_score).to eq(7)
    end
  end

  describe "Rolled 3 times, the second time is a spare" do
    it "adds the bonus spare into score" do
      pending
      subject.roll(4)
      subject.roll(6)
      subject.roll(3)
      expect(subject.calculate_total_score).to eq(16)
    end
  end

end

describe SpareFrame do
  context "when fewer than 10 pins are knocked down" do
    it "is a spare" do
      spare = SpareFrame.new
      spare.roll(6)
      spare.roll(4)
      spare.roll(3)
      results = spare.type_of_frame?([[6,4],[3]])
      expect(results).to eq(true)
    end

    it 'adds score for spare' do
      spare = SpareFrame.new
      spare.roll(6)
      spare.roll(4)
      spare.roll(3)
      expect(spare.score).to eq(13)
    end
  end
end

describe StrikeFrame do
  context 'when all 10 pins are knocked down in the first throw of a frame' do
    it 'is a strike' do
      subject.roll(10)
      subject.roll(0)
      subject.roll(3)
      subject.roll(2)
      results = subject.type_of_frame?([[10,0],[3,2]])
      expect(results).to eq(true)
    end

    it 'adds score for a strike' do
      subject.roll(10)
      subject.roll(0)
      subject.roll(3)
      subject.roll(2)
      expect(subject.score).to eq(15)
    end
  end
end

describe OpenFrame do
  context 'when fewer than 10 pins are knocked down in a frame' do
    it 'is an open game' do
      subject.roll(4)
      subject.roll(3)
      results = subject.type_of_frame?([4,3])
      expect(results).to eq(true)
    end

    it 'adds score for an open game' do
      subject.roll(4)
      subject.roll(3)
      expect(subject.score).to eq(7)
    end
  end
end
