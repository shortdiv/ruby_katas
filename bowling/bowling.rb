class Game

  attr_reader :rolls
  attr_accessor :score

  def initialize
    @score = 0
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def frames
    @frames = @rolls.each_slice(2).to_a
  end

end

class SpareFrame < Game

  def type_of_game?
    @frames[0][0] + @frames[0][1] == 10
  end

  #method should take in a game and be able to calculate score
  def score
    @score = 10 + @frames[1][0] #10 plus next no. of pins in next throw
  end

end

class StrikeFrame < Game
  def type_of_game?(frame)
    frame[0] == 10
  end

  def score
    split_into_frames = @rolls.each_slice(2).to_a #split game into frames
    @score = 10 + split_into_frames[1][0] + split_into_frames[1][1]
  end

end

class OpenFrame < Game
  def type_of_game?(frame)
    frame[0] + frame[1] < 10
  end

  def score
    split_into_frames = @rolls.each_slice(2).to_a #split game into frames
    @score =  split_into_frames[0][0] + split_into_frames[0][1]
  end
end

