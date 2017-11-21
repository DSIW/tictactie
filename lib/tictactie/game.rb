module TicTacTie
  class Game
    def initialize
      @player1 = Player.new("X")
      @player2 = Player.new("O")

      @board = Board.new
      @current_turn = 1
    end

    def play
      loop do
        puts "Player #{current_player}'s move:".green
        puts @board

        if @board.done?
          puts status.cyan
          break
        end

        move(current_player)
      end
    end

    def move(player)
      choice = Cli.ask("Where would you like to move 'player #{player.symbol}'?".red).to_i

      if @board.free_at?(choice)
        @board.place_symbol(choice, player.symbol)
        @current_turn += 1
      else
        puts "Space unavailable! Please select another cell"
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
