require_relative 'bowling'
require 'minitest/spec'
require 'minitest/autorun'

describe Bowl do
  before do
    @bowl_on = Bowl.new
  end

  describe "playing new game" do
    before { @result = @bowl_on.score("11111111111111111111") }

    it "counts score without strikes or spares" do
      @result.must_equal 20
    end
  end

  describe "when asked for score with misses" do
    before { @result = @bowl_on.score("9-9-9-9-9-9-9-9-9-9-") }

    it "counts score with misses" do
      @result.must_equal 90
    end
  end

  describe "when asked to count with spares" do
    before { @result = @bowl_on.score("5/5/5/5/5/5/5/5/5/5/5") }

    it "counts score with spares" do
      @result.must_equal 155
    end
  end

  describe "when asked if a game has a spare" do
    before { @result = @bowl_on.spare("4/4/444/") }

    it "prints out number of games with spare" do
      @result.must_equal 2
    end
  end

end
