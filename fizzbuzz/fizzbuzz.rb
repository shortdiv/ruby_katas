class FizzBuzz

  def convert(num)

    raise unless num.is_a?(Numeric)

    if num % 15 == 0
      return "FizzBuzz"
    elsif num % 3 == 0
      return "Fizz"
    elsif num % 5 == 0
      return "Buzz"
    end
  end

end