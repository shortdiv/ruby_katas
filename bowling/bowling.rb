class Bowl

  def score(game)
    @points = 0
    game.split("").each do |single|
      @points += single.to_i
    end
    return @points
  end

end