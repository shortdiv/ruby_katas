class Game

  attr_reader :rolls
  attr_accessor :score

  def initialize
    @score = 0
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
    @frames = @rolls.each_slice(2).to_a
  end

  def calculate_total_score
    strike = StrikeFrame.new
    spare = SpareFrame.new
    open = OpenFrame.new
    game_types = [strike,spare,open]
    game_types.each do |game|
      if game.type_of_frame?(@frames)
        game.score
      end
    end
  end

end

class SpareFrame < Game

  def type_of_frame?(frames)
    frames[0][0] + frames[0][1] == 10
  end

  #method should take in a game and be able to calculate score
  def score
    @score = 10 + @frames[1][0] #10 plus next no. of pins in next throw
  end

end

class StrikeFrame < Game
  def type_of_frame?(frames)
    frames[0][0] == 10
  end

  def score
    @score = 10 + @frames[1][0] + @frames[1][1]
  end

end

class OpenFrame < Game
  def type_of_frame?(frames)
    frames[0][0] + frames[0][1] < 10
  end

  def score
    @score = @frames[0][0] + @frames[0][1]
  end
end

