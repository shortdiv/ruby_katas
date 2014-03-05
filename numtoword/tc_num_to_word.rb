require_relative "num_to_word"
require "test/unit"

class TestNumToWord < Test::Unit::TestCase

  def test_num
    assert_equal(9000, NumberstoWords.split_num(9870, 1000) )
  end

  def test_num2
    assert_equal(870, NumberstoWords.take_away(9870, 1000) )
  end

  def test_num3
    assert_equal([9000, 800, 70], NumberstoWords.num_array(9870) )
  end

  def test_num4
    assert_equal("Nine Thousand Eight Hundred Seven Six", NumberstoWords.convert_word(9876) )
  end

  def test_typecheck
    assert_raise (RuntimeError) { NumberstoWords.convert_word('a') }
  end

end