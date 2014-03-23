require_relative 'fizzbuzz'
require 'minitest/spec'
require 'minitest/autorun'

class TestFizzBuzz < MiniTest::Unit::TestCase

  def setup
    @check_number = FizzBuzz.new
  end

   def type_check
    assert_raise (RuntimeError) { @check_number.convert('a') }
  end

  def test_input
    assert_equal("Buzz", @check_number.convert(10) )
    assert_equal("FizzBuzz", @check_number.convert(45))
    assert_equal("FizzBuzz", @check_number.convert(0))
  end

end