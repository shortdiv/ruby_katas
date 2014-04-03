class Bowling

  class OpenGame

    def what_kind_of_game?(game)
      game.each_char do |throw|
        if (throw == "/") || (throw == "X")
          return false
        else
          return true
        end
      end
    end

    def score(game)
      @points = 0
      game.each_char do |single|
        @points += single.to_i
      end
      return @points
    end

  end

end