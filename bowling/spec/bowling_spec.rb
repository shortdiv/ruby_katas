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

end

describe Frame
  context "when fewer than 10 pins are knocked down" do
    it "is an open frame" do
      #when you call roll, what do you want code in toll to look like?
    end
  end

end
