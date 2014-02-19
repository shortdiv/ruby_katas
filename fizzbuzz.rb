MULTIPLE_COND = {
15 => :FizzBuzz,
3 => :Fizz,
5 => :Buzz
}

def pop(counter)
  MULTIPLE_COND.keys.each do |multiple|
    if counter % multiple == 0
      return MULTIPLE_COND[multiple]
    end
  end
    return counter
end

puts pop(45)
puts pop(6)
puts pop(10)
puts pop(4)
puts pop(0)