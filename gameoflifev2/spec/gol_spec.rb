require "spec_helper"
require_relative "../gol"

describe GameofLife do

  it 'should change live cells to dead cells' do
    expect {GameofLife}.to change {GameofLife.count}.from(4).to(0)
  end

  ## changing state from initial state to final state ##

end

#one specific board
