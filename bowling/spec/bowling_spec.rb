require_relative '../bowling'

describe Bowling do
  before(:each) do
    @bowl = Bowling::OpenGame.new
  end

  context "when asked what kind of game it is" do
    it "checks game and returns open game" do
      results = @bowl.what_kind_of_game?("11111111111111111111")
      expect(results).to eq(true)
    end
  end

  context "when asked to calculate score given an open game with just ones" do
    it "equates to 20" do
      results = @bowl.score("11111111111111111111")
      expect(results).to eq 20
    end
  end

  context "when asked to calculate score with alternating 1s and misses where the first try is a score and second is a miss" do
    it "equates to 90" do
      results = @bowl.score("1-1-1-1-1-1-1-1-1-1-")
      expect(results).to eq 10
    end
  end

  context "when asked to calculate score with alternating 1s and misses where the first try is a miss and the second is a score" do
    it "equates to 10" do
      results = @bowl.score("-1-1-1-1-1-1-1-1-1-1")
      expect(results).to eq 10
    end
  end

  context "when asked to calculate score with one spare in the first frame" do
    it "equates to 29" do
      results = @bowl.score("3/111111111111111111")
      expect(results).to eq 29
    end
  end

end

