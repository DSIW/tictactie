require "spec_helper"

RSpec.describe TicTacTie::Board do
  let(:board) { described_class.new }

  describe "#to_s" do
    context 'with empty spaces' do
      it 'returns' do
        expect(board.to_s).to eq <<~BOARD
                                    0 | 1 | 2
                                    -----------
                                    3 | 4 | 5
                                    -----------
                                    6 | 7 | 8
                                    BOARD
      end
    end

    context 'place X to 0 and 8' do
      before do
        board.place_symbol(0, 'X')
        board.place_symbol(8, 'X')
      end

      it 'returns' do
        expect(board.to_s).to eq <<~BOARD
                                    X | 1 | 2
                                    -----------
                                    3 | 4 | 5
                                    -----------
                                    6 | 7 | X
                                    BOARD
      end
    end

    context 'place X\'s in a row' do
      before do
        board.place_symbol(0, 'X')
        board.place_symbol(4, 'X')
        board.place_symbol(8, 'X')
      end

      it 'returns' do
        expect(board.to_s).to eq <<~BOARD
                                    X | 1 | 2
                                    -----------
                                    3 | X | 5
                                    -----------
                                    6 | 7 | X
                                    BOARD
      end
    end
  end

  describe "done?" do
    context 'place X\'s in a row' do
      before do
        board.place_symbol(0, 'X')
        board.place_symbol(4, 'X')
        board.place_symbol(8, 'X')
      end

      it 'returns' do
        expect(board.done?).to be_truthy
      end
    end
  end

  describe "#free_at?" do
    context 'space is free' do
      it 'places stone on space' do
        expect(board.free_at?(0)).to be true
      end
    end

    context 'space is occupied' do
      before do
        board.place_symbol(0, 'X')
      end

      it 'doesn\' place stone on space' do
        expect(board.free_at?(0)).to be false
      end
    end
  end
end
