require_relative 'dice'
require 'minitest/spec'
require 'minitest/autorun'

describe Dice do
  before do
    @new_roll = Dice.new
  end

  describe "when asked for results in 5 rolls" do
    it "makes an enumerated hash of results" do
      @new_roll.hashing([1,3,1,1,5]).must_equal ({1=>3, 3=>1, 5=>1})
    end
  end

  describe "when asked if there is a set of 3 repeated results" do
    it "will remove the set if there is one" do
      @new_roll.set_of_three([1,3,5,1,1]).must_equal ({1=>0, 3=>1, 5=>1})
    end
  end

  describe "when asked about the total score" do
    it "will calculate total score for 1 game" do
      @new_roll.score([1,3,1,1,1]).must_equal 1100
    end
  end

end
