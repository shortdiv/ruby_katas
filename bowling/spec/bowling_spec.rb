require_relative '../bowling'

describe Game do

  it "has a zero score" do
    expect(subject.score).to eq(0)
  end
<<<<<<< HEAD

=======
>>>>>>> ce16356f6c9bdbfcfdde4a36c2480a62f33669ce
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

<<<<<<< HEAD
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
=======
end

describe Frame
  context "when fewer than 10 pins are knocked down" do
    it "is an open frame" do
      #when you call roll, what do you want code in toll to look like?
>>>>>>> ce16356f6c9bdbfcfdde4a36c2480a62f33669ce
    end
  end

end
<<<<<<< HEAD


=======
>>>>>>> ce16356f6c9bdbfcfdde4a36c2480a62f33669ce
