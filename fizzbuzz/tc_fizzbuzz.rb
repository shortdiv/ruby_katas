require_relative "fizzbuzz"
require "test/unit"

class TestFizzBuzz < Test::Unit::TestCase

   def type_check
    check_number = FizzBuzz.new
    assert_raise (RuntimeError) { check_number.convert('a') }
  end

  def test_input
    check_number = FizzBuzz.new
    assert_equal("Buzz", check_number.convert(10) )
    assert_equal("FizzBuzz", check_number.convert(45))
    assert_equal("FizzBuzz", check_number.convert(0))
  end

end