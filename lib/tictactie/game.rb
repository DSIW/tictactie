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
        else
          @current_turn += 1
          move(current_player)
        end
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
      else
        print_unavailable_space
      end
    end

    def ask_choice(player)
      TicTacTie::CliGame.ask("Where would you like to move 'player #{player.symbol}'?".red).to_i
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
