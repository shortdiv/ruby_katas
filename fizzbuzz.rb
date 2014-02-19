def pop(counter)
  tres = counter % 3 == 0
  cinco = counter % 5 == 0
  tres_y_cinco = tres && cinco

  if tres_y_cinco
    puts "FizzBuzz"
  elsif tres
    puts "Fizz"
  elsif cinco
    puts "Buzz"
  else
    puts counter
  end
end