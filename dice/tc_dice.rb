require_relative 'dice'
require 'minitest/spec'
require 'minitest/autorun'

describe Dice do
  before do
    @new_roll = Dice.new
  end

  describe "when asked to make a hash" do
    it "makes a hash" do
      @new_roll.hashing([1,3,1,1,5]).must_equal ({1=>3, 3=>1, 5=>1})
    end
  end

  describe "when asked if there is a set of 3" do
    it "will update and output the score" do
      @new_roll.set_of_three([1,3,5,1,1]).must_equal ({1=>0, 3=>1, 5=>1})
    end
  end

  describe "when asked about the total score" do
    it "will calculate total score for 1 game" do
      @new_roll.score([1,3,1,1,1]).must_equal 1100
    end
  end

end
