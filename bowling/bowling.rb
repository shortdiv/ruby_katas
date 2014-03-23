class Bowl

  def score(game)
    @points = 0
    game.each_char do |single|
      if single == "/"
        @points += 10
      else
      #   index = game.index(single) #get index of one throw score
      #   @points += 10 #+ game_array[index + 1].to_i
      #   single = game[index + 2]
      # end
        @points += single.to_i
      end
    end
    return @points
  end

  def spare(game)
  end

end