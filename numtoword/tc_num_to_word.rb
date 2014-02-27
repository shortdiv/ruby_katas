require_relative "num_to_word"
require "test/unit"

class TestNumToWord < Test::Unit::TestCase

  def setup
    @num = NumberstoWords.new(9870)
  end

  def test_num
    assert_equal(9000, @num.split_num(9870, 1000) )
  end

  def test_num2
    assert_equal(870, @num.take_away(9870, 1000) )
  end

  def test_num3
    assert_equal([900, 800, 70], @num.num_array(9870) )
  end

  def test_num4
    assert_equal("Nine Thousand Eight Hundred Seven special case", @num.convert_to_word(9870) )
  end

  def test_typecheck
    assert_raise (RuntimeError) { NumberstoWords.new('a') }
  end

end