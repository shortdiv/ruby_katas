require_relative '../bowling'

describe Game do

  it "has a zero score" do
    expect(subject.score).to eq(0)
  end

  describe "Rolling a Ball" do
    it "changes the score" do
      subject.roll(4)
      expect(subject.score).to eq(4)
    end
  end

  describe "Rolling 2 balls" do
    it "adds two scores" do
      subject.roll(4)
      subject.roll(3)
      expect(subject.score).to eq(7)
    end
  end

  describe "Rolled 3 times, the second time is a spare" do
    it "adds the bonus spare into score" do
      pending 'not implemented spare scoring'
      subject.roll(4)
      subject.roll(6)
      subject.roll(3)
      expect(subject.score).to eq(16)
    end
  end

end

describe SpareFrame do
  context "when fewer than 10 pins are knocked down" do
    it "is a spare" do
      results = subject.spare?([6,4])
      expect(results).to eq(true)
    end

    it 'adds score for spare' do
      subject.roll(6)
      subject.roll(4)
      subject.roll(3)
      expect(subject.spare_score).to eq(13)
    end
  end
end

describe StrikeGame do
  context 'when all 10 pins are knocked down in the first throw of a frame' do
    it 'is a strike' do
      results = subject.strike?([10,0])
      expect(results).to eq(true)
    end

    it 'adds score for a strike' do
      subject.roll(10)
      subject.roll(0)
      subject.roll(3)
      subject.roll(2)
      expect(subject.strike_score).to eq(15)
    end
  end
end

