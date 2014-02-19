def pop
  counter = 0
  for counter in 1..100
    if counter % 15 == 0
      puts "FizzBuzz"
    elsif counter % 3 == 0
      puts "Fizz"
    elsif counter % 5 == 0
      puts "Buzz"
    else
      puts counter
    end
  end
end

pop