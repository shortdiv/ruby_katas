class Bowl

  def score(numbers)
    @points = 0
    numbers.each do |single|
      @points += single
    end
    return @points
  end

end