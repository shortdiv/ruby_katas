require_relative 'bowling'
require 'minitest/spec'
require 'minitest/autorun'

class Bowling < MiniTest::Unit::TestCase

  def setup
    @bowl_on = Bowl.new
  end

  def test_score
    assert_equal 20, @bowl_on.score("11111111111111111111")
  end

end
