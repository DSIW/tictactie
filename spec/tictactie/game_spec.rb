require "spec_helper"

RSpec.describe TicTacTie::Game do
  let(:game) { described_class.new }

  describe "status" do
    context "correct player has won with message" do

      before do
        game.board.place_symbol(0, 'X')
        game.board.place_symbol(4, 'X')
        game.board.place_symbol(8, 'X')
      end

      it 'returns' do
        expect(game.send(:status)).to eq "Congratulations, player X won!"
      end

    end
  end
end
