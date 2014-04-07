require_relative '../bowling'

describe Game do

  it "has a zero score" do
    expect(subject.calculate_total_score).to eq(0)
  end

  describe "Rolling a Ball" do
    it "changes the score" do
      subject.roll(4)
      expect(subject.calculate_total_score).to eq(4)
    end
  end

  describe "Rolling 2 balls" do
    it "adds two scores" do
      subject.roll(4)
      subject.roll(3)
      expect(subject.calculate_total_score).to eq(7)
    end
  end

  describe "Rolled 3 times, the second time is a spare" do
    it "adds the bonus spare into score" do
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
      subject.roll(6)
      subject.roll(4)
      subject.roll(3)
      results = subject.type_of_game?
      expect(results).to eq(true)
    end

    it 'adds score for spare' do
      subject.roll(6)
      subject.roll(4)
      subject.roll(3)
      expect(subject.score).to eq(13)
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
      results = subject.type_of_game?
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
      results = subject.type_of_game?
      expect(results).to eq(true)
    end

    it 'adds score for an open game' do
      subject.roll(4)
      subject.roll(3)
      expect(subject.score).to eq(7)
    end
  end
end

