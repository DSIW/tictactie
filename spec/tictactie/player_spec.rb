require "spec_helper"

RSpec.describe TicTacTie::Player do
  it "has a symbol" do
    player = described_class.new(:"player1")
    expect(player.symbol).to eq :player1
  end
end
