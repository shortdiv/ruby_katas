require_relative 'dice'
require 'minitest/spec'
require 'minitest/autorun'

class TestDice < MiniTest::Unit::TestCase

  def setup
    @new_roll = Dice.new
  end

  def test_hashing
    assert_equal ({1=>3, 3=>1, 5=>1}), @new_roll.hashing([1,3,1,1,5])
  end

  def test_set_of_three
    assert_equal ({1=>0, 3=>1, 5=>1}), @new_roll.set_of_three([1,3,5,1,1])
  end

  def test_set_of_three2
    assert_equal ({1=>1, 3=>1}), @new_roll.set_of_three([1,3,1,1,1])
  end

  def test_score
    assert_equal (1100), @new_roll.score([1,3,1,1,1])
  end

end
