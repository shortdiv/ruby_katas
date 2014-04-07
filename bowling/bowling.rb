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

class OpenFrame
  def open_frame?(frame)
    frame[0] + frame[1] == 10
  end
end