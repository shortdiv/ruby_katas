require_relative 'bowling'
require 'minitest/spec'
require 'minitest/autorun'

class Bowling < MiniTest::Unit::TestCase

  def setup
    @bowl_on = Bowl.new
  end

  def test_simple_score
    assert_equal 20, @bowl_on.score("11111111111111111111")
  end

  def test_with_misses
    assert_equal 90, @bowl_on.score("9-9-9-9-9-9-9-9-9-9-")
  end

  def test_with_second_spares
    assert_equal 150, @bowl_on.score("5/5/5/5/5/5/5/5/5/5/5")
  end

end
