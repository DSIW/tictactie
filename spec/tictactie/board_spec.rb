require "spec_helper"

RSpec.describe TicTacTie::Board do
  let(:board) { described_class.new }

  before do
    # TODO: refactor code
    board.instance_variable_set(:@current_turn, 0)
  end

  describe "#to_s" do
    context 'with empty spaces' do
      it 'returns' do
        expect(board.to_s).to eq <<-BOARD
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
        expect(board.to_s).to eq <<-BOARD
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
        expect(board.to_s).to eq <<-BOARD
X | 1 | 2
-----------
3 | X | 5
-----------
6 | 7 | X
    BOARD
      end
    end
  end

  describe "#check_space" do
    context 'space is free' do
      it 'places stone on space' do
        expect(board).to receive(:place_symbol)
        board.check_space(0, 'Y')
      end
    end

    context 'space is occupied' do
      before do
        board.place_symbol(0, 'X')
      end

      it 'doesn\' place stone on space' do
        expect(board).not_to receive(:place_symbol)
        board.check_space(0, 'Y')
      end
    end
  end

  describe "#tie" do
    context 'with stones are not in a row' do
      before do
        board.place_symbol(0, 'X')
        board.place_symbol(4, 'X')
        board.place_symbol(8, 'X')
      end

      it 'should return false' do
        expect(board.tie).not_to be true
      end
    end

    context 'with stones in a row from different players' do
      before do
        board.place_symbol(0, 'X')
        board.place_symbol(4, 'Y')
        board.place_symbol(8, 'X')
      end

      it 'should return false' do
        expect(board.tie).not_to be true
      end
    end

    context 'with board is full and there is no winner' do
      before do
        board.place_symbol(0, 'a')
        board.place_symbol(1, 'b')
        board.place_symbol(2, 'c')
        board.place_symbol(3, 'd')
        board.place_symbol(4, 'e')
        board.place_symbol(5, 'f')
        board.place_symbol(6, 'g')
        board.place_symbol(7, 'h')
        board.place_symbol(8, 'i')
      end

      it 'should return true' do
        expect(board.tie).to be true
      end
    end
  end
end
