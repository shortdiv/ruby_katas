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

  def score
    @rolls.each do |r|
      @score += r
    end
    @score
  end
end

class SpareFrame < Game

  def spare?(frame)
    frame[0] + frame[1] == 10
  end

  #method should take in a game and be able to calculate score
  def spare_score
    split_into_frames = @rolls.each_slice(2).to_a #split game into frames of 2 throws
    @score = 10 + split_into_frames[1][0] #10 plus next no. of pins in next throw
  end

end

class StrikeGame < Game
  def strike?(frame)
    frame[0] == 10
  end

  def strike_score
    split_into_frames = @rolls.each_slice(2).to_a #split game into frames
    @score = 10 + split_into_frames[1][0] + split_into_frames[1][1]
  end

end

class OpenGame < Game
  def open?(frame)
    frame[0] + frame[1] < 10
  end

  def open_score
    split_into_frames = @rolls.each_slice(2).to_a #split game into frames
    @score =  split_into_frames[0][0] + split_into_frames[0][1]
  end
end

