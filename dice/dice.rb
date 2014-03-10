class Dice
  def hashing(dice)
    @counter = Hash.new(0)
    dice.each { |element|
      @counter[element] += 1
    }
    return @counter
  end

  def set_of_three(dice)
    @points = 0
    hashing(dice)
    @counter.select{ |element, count|
      if @counter >= 3
        if element == 1
          @points += 1000
        else
          @points += (3 * element)
        end
        @counter[element] -= 3
      end
    }
    return @counter
  end

  def score(dice)
    set_of_three(dice)
    @counter.keys.each {|e|
      if e == 1
        @points += (100 * @counter[e])
      elsif e == 5
        @points += (50 * @counter[e])
      end
    }
    return @points
  end

end