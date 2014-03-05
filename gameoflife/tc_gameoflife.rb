require_relative "gameoflife"
require "test/unit"

class TestGame < Test::Unit::TestCase

  def test_transition
    assert_equal( 2, Game.new.find_neighbors(2,2) )
  end

end