require_relative 'bowling'
require 'minitest/spec'
require 'minitest/autorun'

class Bowling < MiniTest::Unit::TestCase

  def setup
    @bowl_on = Bowl.new
  end

  def test_score
    assert_equal 10, @bowl_on.score([1,1,1,1,1,1,1,1,1,1])
  end
end
