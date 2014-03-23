class FizzBuzz

  CONDITIONS = {
    15 => "FizzBuzz",
    3 => "Fizz",
    5 => "Buzz"
  }

  def convert(num)

    raise unless num.is_a?(Numeric)

    CONDITIONS.keys.each do |multiple|
      if num % multiple == 0
        return CONDITIONS[multiple]
      end
    end
  end

end