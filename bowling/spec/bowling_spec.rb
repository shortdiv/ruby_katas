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
      subject.roll(4)
      subject.roll(6)
      subject.roll(3)
      expect(subject.score).to eq(16)
    end
  end

end

describe Frame do
  context "when fewer than 10 pins are knocked down" do
    it "is an open frame" do
      expect(subject.openframe?).to eq(true)
    end
  end

end


