module TicTacTie
  class Game
    attr_accessor :board
    
    def initialize
      @player1 = Player.new("X")
      @player2 = Player.new("O")

      @board = Board.new
      @current_turn = 1
    end

    def play
      loop do
        print_board

        if @board.done?
          print_status
          break
        end

        move(current_player)
      end
    end

    def print_board
      raise NoImplementedError
    end

    def print_status
      raise NoImplementedError
    end

    def ask_choice(player)
      raise NoImplementedError
    end

    def print_unavailable_space
      raise NoImplementedError
    end

    private

    def move(player)
      choice = ask_choice(player)

      if @board.free_at?(choice)
        @board.place_symbol(choice, player.symbol)
        @current_turn += 1
      else
        print_unavailable_space
      end
    end

    def status
      if @board.player_won?
        "Congratulations, player #{current_player} won!"
      elsif @board.full?
        "It's a Draw!"
      end
    end

    def current_player
      @current_turn.even? ? @player2 : @player1
    end
  end
end
