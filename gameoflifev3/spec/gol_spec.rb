require_relative "../gol"

describe Cell do
  it 'knows if alive or dead' do
    expect(subject.isalive?).to eq(true)
  end


end